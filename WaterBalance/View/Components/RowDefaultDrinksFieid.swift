//
//  RowDefaultDrinksFieid.swift
//  WaterBalance
//
//  Created by Иван Морозов on 15.05.2022.
//

import SwiftUI


struct RowDefaultDrinksFieid: View {
    var defaultDrink: DefaultDrink
    var body: some View {
        HStack(){
            if defaultDrink.name == "Water"{
                Image(uiImage: UIImage(named: "water")!)
                    .resizable()
                    .frame(width: 30, height:30)
            }
            else if defaultDrink.name == "Coffee"{
                Image(uiImage: UIImage(named: "coffee")!)
                    .resizable()
                    .frame(width: 30, height:30)
            }
            else if defaultDrink.name == "Beer"{
                Image(uiImage: UIImage(named: "beer")!)
                    .resizable()
                    .frame(width: 30, height:30)
            }
            else if defaultDrink.name == "Lemonade"{
                Image(uiImage: UIImage(named: "lemonade")!)
                    .resizable()
                    .frame(width: 30, height:30)
            }
            else if defaultDrink.name == "Energy drink"{
                Image(uiImage: UIImage(named: "energy")!)
                    .resizable()
                    .frame(width: 30, height:30)
            }
            else if defaultDrink.name == "Tea"{
                Image(uiImage: UIImage(named: "tea")!)
                    .resizable()
                    .frame(width: 30, height:30)
            }
            else if defaultDrink.name == "Red wine"{
                Image(uiImage: UIImage(named: "wine")!)
                    .resizable()
                    .frame(width: 30, height:30)
            }
           else if defaultDrink.name == "Milk"{
               Image(uiImage: UIImage(named: "milk")!)
                   .resizable()
                   .frame(width: 30, height:30)
           }
            else if defaultDrink.name == "Juice"{
                Image(uiImage: UIImage(named: "juice")!)
                    .resizable()
                    .frame(width: 30, height:30)
            }
            else {
                Image(uiImage: UIImage(named: "strong_alc")!)
                    .resizable()
                    .frame(width: 30, height:30)
            }
            
            Text(defaultDrink.name)
            Spacer()
        }.padding()
            .background(Color("rowColor"))
            .cornerRadius(18)
            
        
    
            
    }
       
}

struct RowDefaultDrinksFieid_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            RowDefaultDrinksFieid(defaultDrink: DefaultDrink(id: "1", name:"Water" , efficiency: 100, caffeine: 0, alcohol: 0.000))
        }
        .previewLayout(.fixed(width: 300, height: 40))
        .cornerRadius(20)
        
    }
}
