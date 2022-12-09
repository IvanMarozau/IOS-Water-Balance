//
//  AmountWaterViewModel.swift
//  WaterBalance
//
//  Created by Иван Морозов on 15.05.2022.
//

import Foundation

class AmountWaterViewModel: ObservableObject{
    
    @Published var defaultDrink: DefaultDrink
    @Published var drink = Drink(name: "", efficiency: 0, caffeine: 0, alcohol: 0.0, amount: 0, water: 0, date: Date(),latitude: 0.0,longitude: 0.0)
    
    init (defaultDrink: DefaultDrink){
        self.defaultDrink = defaultDrink
    }
}
