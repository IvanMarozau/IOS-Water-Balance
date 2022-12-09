//
//  RowDetailDrink.swift
//  WaterBalance
//
//  Created by Иван Морозов on 03.06.2022.
//

import SwiftUI

struct RowDetailDrink: View {
    var drink: Drink
    var body: some View {
        VStack{
        HStack(){
            if drink.name == "Water"{
                Image(uiImage: UIImage(named: "water")!)
                    .resizable()
                    .frame(width: 30, height:30)
            }
            else if drink.name == "Coffee"{
                Image(uiImage: UIImage(named: "coffee")!)
                    .resizable()
                    .frame(width: 30, height:30)
            }
            else if drink.name == "Beer"{
                Image(uiImage: UIImage(named: "beer")!)
                    .resizable()
                    .frame(width: 30, height:30)
            }
            else if drink.name == "Lemonade"{
                Image(uiImage: UIImage(named: "lemonade")!)
                    .resizable()
                    .frame(width: 30, height:30)
            }
            else if drink.name == "Energy drink"{
                Image(uiImage: UIImage(named: "energy")!)
                    .resizable()
                    .frame(width: 30, height:30)
            }
            else if drink.name == "Tea"{
                Image(uiImage: UIImage(named: "tea")!)
                    .resizable()
                    .frame(width: 30, height:30)
            }
            else if drink.name == "Red wine"{
                Image(uiImage: UIImage(named: "wine")!)
                    .resizable()
                    .frame(width: 30, height:30)
            }
           else if drink.name == "Milk"{
               Image(uiImage: UIImage(named: "milk")!)
                   .resizable()
                   .frame(width: 30, height:30)
           }
            else if drink.name == "Juice"{
                Image(uiImage: UIImage(named: "juice")!)
                    .resizable()
                    .frame(width: 30, height:30)
            }
            else {
                Image(uiImage: UIImage(named: "strong_alc")!)
                    .resizable()
                    .frame(width: 30, height:30)
            }
            Text(drink.name)
                .foregroundColor(Color.white)
            Spacer()
            Text("\(drink.amount)")
                .foregroundColor(Color.white)
        }
            Rectangle()
                .fill(Color.white)
                .frame(height: 1)
            HStack{
                VStack(alignment: .leading){
            Text("Water: \(drink.water)")
                .font(.system(size: 12))
                .foregroundColor(Color.white)
            Text("Efficiency: \(drink.efficiency)")
                .font(.system(size: 12))
                .foregroundColor(Color.white)
            Text("Caffeine: \(drink.caffeine)")
                .font(.system(size: 12))
                .foregroundColor(Color.white)
            Text("Alcohol: \(drink.alcohol)")
                .font(.system(size: 12))
                .foregroundColor(Color.white)
            }
                Spacer()
            }
                
        }.padding()
            .background(Color("rowColor"))
            .cornerRadius(18)
    }
}

struct RowDetailDrink_Previews: PreviewProvider {
    static var previews: some View {
        Group{
        RowDetailDrink(drink: Drink(id: "1", name:"Water" , efficiency: 100, caffeine: 0, alcohol: 0.000,amount: 0,water: 0,date: Date(),latitude: 0.0,longitude: 0.0))
        }
        .previewLayout(.fixed(width: 300, height: 150))
        .cornerRadius(20)
    }
}
