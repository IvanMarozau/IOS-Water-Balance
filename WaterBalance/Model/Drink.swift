//
//  Drink.swift
//  WaterBalance
//
//  Created by Иван Морозов on 20.05.2022.
//

import Foundation
import FirebaseFirestore

struct Drink{
    
    var id: String = UUID().uuidString
    var name: String
    var efficiency: Int
    var caffeine: Int
    var alcohol: Double
    var amount:Int
    var water:Int
    var date:Date
    var latitude:Double
    var longitude:Double
    
    
    var representation: [String: Any]{
        var repres = [String: Any]()
        repres["id"] = id
        repres["name"] = name
        repres["efficiency"] = efficiency
        repres["caffeine"] = caffeine
        repres["alcohol"] = alcohol
        repres["amount"] = amount
        repres["water"] = water
        repres["date"] = date
        repres["latitude"] = latitude
        repres["longitude"] = longitude
        return repres
    }
    init( id: String = UUID().uuidString,
          name: String,
          efficiency: Int,
          caffeine: Int,
          alcohol: Double,
          amount:Int,
          water:Int,
          date:Date,
          latitude: Double,
          longitude: Double){
        
        self.id = id
        self.name = name
        self.efficiency = efficiency
        self.caffeine = caffeine
        self.alcohol = alcohol
        self.amount = amount
        self.water = water
        self.date = date
        self.latitude = latitude
        self.longitude = longitude
    }
    
    init?(doc: QueryDocumentSnapshot){
            let data = doc.data()
            
            guard let id = data["id"] as? String else {return nil}
            guard let name = data["name"] as? String else {return nil}
            guard let efficiency = data["efficiency"] as? Int else {return nil}
            guard let caffeine = data["caffeine"] as? Int else {return nil}
            guard let alcohol = data["alcohol"] as? Double else {return nil}
            guard let amount = data["amount"] as? Int else {return nil}
            guard let water = data["water"] as? Int else {return nil}
            guard let date = data["date"] as? Timestamp else {return nil}
        guard let latitude = data["latitude"] as? Double else {return nil}
        guard let longitude = data["longitude"] as? Double else {return nil}
            

        
            self.id = id
            self.name = name
            self.efficiency = efficiency
            self.caffeine = caffeine
            self.alcohol = alcohol
            self.amount = amount
            self.water = water
            self.date = date.dateValue()
        self.latitude = latitude
        self.longitude = longitude
           
            

    }
}
