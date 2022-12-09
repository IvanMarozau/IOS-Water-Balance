//
//  DefaultDrink.swift
//  WaterBalance
//
//  Created by Иван Морозов on 15.05.2022.
//

import Foundation
import FirebaseFirestore

struct DefaultDrink{
    
    var id: String = UUID().uuidString
    var name: String
    var efficiency: Int
    var caffeine: Int
    var alcohol: Double
    
    var representation: [String: Any]{
        var repres = [String: Any]()
        repres["id"] = id
        repres["name"] = name
        repres["efficiency"] = efficiency
        repres["caffeine"] = caffeine
        repres["alcohol"] = alcohol
        
        return repres
    }
    
    init( id: String = UUID().uuidString,
          name: String,
          efficiency: Int,
          caffeine: Int,
          alcohol: Double){
        
        self.id = id
        self.name = name
        self.efficiency = efficiency
        self.caffeine = caffeine
        self.alcohol = alcohol
    }
    
    init?(doc: QueryDocumentSnapshot){
            let data = doc.data()
            
            guard let id = data["id"] as? String else {return nil}
            guard let name = data["name"] as? String else {return nil}
            guard let efficiency = data["efficiency"] as? Int else {return nil}
            guard let caffeine = data["caffeine"] as? Int else {return nil}
            guard let alcohol = data["alcohol"] as? Double else {return nil}
            

        
            self.id = id
            self.name = name
            self.efficiency = efficiency
            self.caffeine = caffeine
            self.alcohol = alcohol
            

    }
    
}
