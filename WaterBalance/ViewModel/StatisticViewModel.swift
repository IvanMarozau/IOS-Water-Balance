//
//  BarGraphViewModel.swift
//  WaterBalance
//
//  Created by Иван Морозов on 01.06.2022.
//

import Foundation
import SwiftUI


class StatisticViewModel: ObservableObject{
    
    @Published var drinkDate: [Drink] = []
    @Published var pom6: Int = 0
    @Published var pom5: Int = 0
    @Published var pom4: Int = 0
    @Published var pom3: Int = 0
    @Published var pom2: Int = 0
    @Published var pom1: Int = 0
    @Published var pom: Int = 0
    
    
    func buildGraf() -> [WaterForDay]{
        var waters: [WaterForDay] = [
            WaterForDay(waters:CGFloat(self.pom2),weekDay: "Mon"),
            WaterForDay(waters:CGFloat(self.pom1),weekDay: "Tue"),
            WaterForDay(waters:CGFloat(self.pom),weekDay: "Wed"),
            WaterForDay(waters:CGFloat(self.pom6),weekDay: "Thu"),
            WaterForDay(waters:CGFloat(self.pom5),weekDay: "Fri"),
            WaterForDay(waters:CGFloat(self.pom4),weekDay: "Sat"),
            WaterForDay(waters:CGFloat(self.pom3),weekDay: "Sun")
        ]
   
            return waters
        }
   
    
    func getSumByDate(date: Date){
     
           Database.shared.getAllDrinkByDate(date: date) { result in
               switch result{
               case .success(let drinks):
                   if(Calendar.current
                    .compare(date, to: Calendar.current.date(byAdding: .day, value: -6, to: Date())!, toGranularity: .day)
                      == .orderedSame){
                       self.pom6 = self.getSum(array: drinks)
                       print("pom6: \(self.pom6)")
                   }
                   
                   if(Calendar.current
                    .compare(date, to: Calendar.current.date(byAdding: .day, value: -5, to: Date())!, toGranularity: .day)
                      == .orderedSame){
                       self.pom5 = self.getSum(array: drinks)
                       print("pom5: \(self.pom5)")
                   }
                   if(Calendar.current
                    .compare(date, to: Calendar.current.date(byAdding: .day, value: -4, to: Date())!, toGranularity: .day)
                      == .orderedSame){
                       self.pom4 = self.getSum(array: drinks)
                       print("pom4: \(self.pom4)")
                   }
                   if(Calendar.current
                    .compare(date, to: Calendar.current.date(byAdding: .day, value: -3, to: Date())!, toGranularity: .day)
                      == .orderedSame){
                       self.pom3 = self.getSum(array: drinks)
                       print("pom3: \(self.pom3)")
                   }
                   if(Calendar.current
                    .compare(date, to: Calendar.current.date(byAdding: .day, value: -2, to: Date())!, toGranularity: .day)
                      == .orderedSame){
                       self.pom2 = self.getSum(array: drinks)
                       print("pom2: \(self.pom2)")
                   }
                   if(Calendar.current
                    .compare(date, to: Calendar.current.date(byAdding: .day, value: -1, to: Date())!, toGranularity: .day)
                      == .orderedSame){
                       self.pom1 = self.getSum(array: drinks)
                       print("pom1: \(self.pom1)")
                   }
                   if(Calendar.current
                    .compare(date, to: Date(), toGranularity: .day)
                      == .orderedSame){
                       self.pom = self.getSum(array: drinks)
                       print("pom: \(self.pom)")
                   }
                   
                   
               case .failure(let error):
                   print (error.localizedDescription)
               }
           }
       }
    
    func getSum(array:[Drink])->Int{
        var sum = 0
        for i in 0..<array.count{
            sum+=array[i].water
        }
        return sum
    }
    
}
