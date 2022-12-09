//
//  LocationManager.swift
//  WaterBalance
//
//  Created by Иван Морозов on 28.05.2022.
//

import Foundation
import CoreLocation
import Combine
import MapKit

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    
    //let objectWillChange = PassthroughSubject<Void, Never>()

    @Published var region: MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 0, longitude: 0),
        span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    @Published var location: CLLocation?

    @Published var locationName: String = "Empty"
    
    @Published var temperture: Double = 0.0
    
    override init() {
        super.init()

        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.location = location
        self.region.center = location.coordinate
        reverseGeocode(location: location)
        loadData(location: location)
        
    }
    
    private func reverseGeocode(location: CLLocation) {
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location){ placemarks, error in
            guard error == nil else {
                self.locationName = "Some Error"
                return
            }
            if let firstPlacemark = placemarks?.first{
                self.locationName = firstPlacemark.locality ?? "Empty locality"
            } else {
                self.locationName = "Not found"
            }
        }
    }
        
    func loadData(location: CLLocation) {
        let lat = location.coordinate.latitude
        let lon = location.coordinate.longitude
        guard let url = URL(string: "https://api.forecast.io/forecast/3c6670ca22466eadc48988aa696094c9/\(lat),\(lon)") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, error == nil {
                print("Successfully downloaded.")
                
                var jsonData: Any
                do{
                    jsonData = try JSONSerialization.jsonObject(with: data)
                    let temperature = self.parseTemperature(jsonData: jsonData)
                    
                    DispatchQueue.main.async() { () -> Void in
                        self.temperture = temperature ?? -99.9
                    }
                } catch {
                    print("Can not create JSON object")
                }
            } else {
                print("Error took place while downloading a file.");
            }
        }.resume()
    }
    
    private func parseTemperature(jsonData: Any) -> Double? {
        guard let items = jsonData as? [String: Any],
            let currently = items["currently"] as? [String: Any],
            let temperature = currently["temperature"] as? Double else {
                return nil
        }
        return temperature
    }
    
}

