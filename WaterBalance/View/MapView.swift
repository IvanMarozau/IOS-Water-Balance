//
//  MapView.swift
//  WaterBalance
//
//  Created by Иван Морозов on 28.05.2022.
//
import SwiftUI
import MapKit


struct AnnotatedItem: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}

struct MapView: View {
    var drink: Drink
    @State var region: MKCoordinateRegion
    @State private var mapType: MKMapType = .standard
    @State private var trackingMode = MapUserTrackingMode.follow
    
    var body: some View {
        Map(coordinateRegion: $region,
            interactionModes: .all,
        showsUserLocation: true,
            userTrackingMode: $trackingMode, annotationItems: [AnnotatedItem(name:"Pin",coordinate: .init(latitude: drink.latitude, longitude: drink.longitude))]){ item in
            MapPin(coordinate:item.coordinate , tint: .red)
        }
        
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        let drink = Drink(name: "", efficiency: 0, caffeine: 0, alcohol: 0.0, amount: 0, water: 0, date: Date(), latitude: 0.0, longitude: 0.0)
        MapView(drink: drink, region: MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 10.0, longitude: 10.0),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)))
    }
}
