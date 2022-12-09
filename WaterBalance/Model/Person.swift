//
//  Person.swift
//  WaterBalance
//
//  Created by Иван Морозов on 28.05.2022.
//

import Foundation
import FirebaseFirestore

struct Person{
    
    var id: String = UUID().uuidString
    var height: Int
    var weight: Int
    var gender: String
    var dailyNormOfWater: Int
    
    var representation: [String: Any]{
        var repres = [String: Any]()
        repres["id"] = id
        repres["weight"] = weight
        repres["height"] = height
        repres["gender"] = gender
        repres["dailyNormOfWater"] = dailyNormOfWater

        return repres
    }
    
    init( id: String = UUID().uuidString,
          height: Int,
          weight: Int,
          dailyNormOfWater:Int,
          gender:String){
        
        self.id = id
        self.height = height
        self.weight = weight
        self.dailyNormOfWater = dailyNormOfWater
        self.gender = gender
    }
     
}
