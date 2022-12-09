//
//  DrinkDetailViewModel.swift
//  WaterBalance
//
//  Created by Иван Морозов on 28.05.2022.
//

import SwiftUI

class DrinkDetailViewModel: ObservableObject{
    
    @Published var drink: Drink
    
    init (drink: Drink){
        self.drink = drink
    }
    
    func deleteDrink(){
        Database.shared.deleteDrink(drink: drink)
    }
}
