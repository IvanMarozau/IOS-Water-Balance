//
//  HistoryViewModel.swift
//  WaterBalance
//
//  Created by Иван Морозов on 28.05.2022.
//

import Foundation
class HistoryViewModel : ObservableObject{
    @Published var drinks: [Drink]
    
    static let shared = HistoryViewModel()
    
    init(){
    drinks = [Drink]()
    }
    
    func getAllDrinks(){
        Database.shared.getAllDrinks{ result in
            switch result{
            case .success(let drinks):
                self.drinks = drinks
                print("Count of drink: \(drinks.count)")
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
