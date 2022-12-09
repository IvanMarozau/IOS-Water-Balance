//
//  ContentView.swift
//  WaterBalance
//
//  Created by Иван Морозов on 14.05.2022.
//

import SwiftUI

struct DefaultDrinkView: View {
    @State var amountPresented = false
    @StateObject var viewModel: DefaultDrinksViewModel
    @State var defDrink: DefaultDrink = DefaultDrink(name: "", efficiency: 0, caffeine: 0, alcohol: 0)
    @State var water: Int = 0
    @StateObject var viewModelStat: StatisticViewModel
    
    @StateObject var viewModelPerson: PersonViewModel
    
    var body: some View {
        NavigationView{
                ScrollView{
                    VStack{
                        Text("\(NSString(format: "%.0f", round(Float(viewModelStat.pom)/Float(viewModelPerson.person.dailyNormOfWater)*100)))%")
                            .font(.system(size: 28))
                            .padding(.top,30)
                        Text("water balance today")
                            .opacity(0.4)
                            .font(.system(size: 12))
                        ProgressView(value:Float(viewModelStat.pom),total: Float(viewModelPerson.person.dailyNormOfWater))
                            .background(Color("rowColor"))
                            .tint(Color.white)
                            .padding(.trailing,10)
                            .padding(.leading,10)
                        HStack{
                            Text("\(viewModelStat.pom) ml")
                            .font(.system(size: 12))
                            .padding(.bottom,10)
                            Spacer()
                            Text("\(viewModelPerson.person.dailyNormOfWater) ml")
                            .font(.system(size: 12))
                            .padding(.bottom,10)
                        }
                        .padding()
                    }.frame(width: 300, height: 110)
                    .background(Color.blue)
                        .cornerRadius(20)
                        
                   
                ForEach(viewModel.defaultDrinks, id: \.id){
                    item in
                    Button{
                        amountPresented = true
                        defDrink = item
                    }label:{
                        
                        RowDefaultDrinksFieid(defaultDrink: item)
                            .foregroundColor(.white)
                            .sheet(isPresented: $amountPresented){
                                
                                AmountWaterView(amountPresented:$amountPresented, defDrink: $defDrink, viewModelStat: viewModelStat)
                            }
                            
                    }
                }
            }
                .navigationTitle(Text("Drinks"))
                    .preferredColorScheme(.dark)
                    .onAppear{
                        self.viewModel.getAllDefaultDrinks()
                        self.viewModelPerson.getPerson()
                        self.viewModelStat.getSumByDate(date: Date())
                       
                    }
        }
       
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DefaultDrinkView(viewModel: DefaultDrinksViewModel(), viewModelStat: StatisticViewModel(), viewModelPerson: PersonViewModel(person: Person(height: 0, weight: 0, dailyNormOfWater: 0, gender: "")))
    }
}
