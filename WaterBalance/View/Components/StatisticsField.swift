//
//  StatisticsField.swift
//  WaterBalance
//
//  Created by Иван Морозов on 05.06.2022.
//

import SwiftUI

struct StatisticsField: View {
    var waterForDay: WaterForDay
    var body: some View {
        VStack{
        HStack(){
                Image(uiImage: UIImage(named: "water")!)
                    .resizable()
                    .frame(width: 30, height:30)
          
            Text("Water: ")
            Spacer()
            Text("\(NSString(format: "%.0f", round(waterForDay.waters))) ml")
        }
            
        }
        .padding()
            .background(Color("rowColor"))
            .cornerRadius(18)
    }
}

struct StatisticsField_Previews: PreviewProvider {
    static var previews: some View {
        Group{
        StatisticsField(waterForDay: WaterForDay(waters: 200, weekDay: ""))
    }
    .previewLayout(.fixed(width: 300, height: 40))
    .cornerRadius(20)
    }
}
