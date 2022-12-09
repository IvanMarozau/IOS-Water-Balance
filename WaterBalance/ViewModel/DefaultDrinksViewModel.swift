//
//  DefaultDrinksViewModel.swift
//  WaterBalance
//
//  Created by Иван Морозов on 15.05.2022.
//

import Foundation

class DefaultDrinksViewModel: ObservableObject{
    @Published var defaultDrinks: [DefaultDrink]
    
    static let shared = DefaultDrinksViewModel()
    
    init(){
    defaultDrinks = [DefaultDrink]()
    }
    
    func getAllDefaultDrinks(){
        Database.shared.getAllDefaultDrinks{ result in
            switch result{
            case .success(let defaultDrinks):
                self.defaultDrinks = defaultDrinks
                print("Count of default drink: \(defaultDrinks.count)")
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
