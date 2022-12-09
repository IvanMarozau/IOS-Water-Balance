//
//  AmountWaterView.swift
//  WaterBalance
//
//  Created by Иван Морозов on 15.05.2022.
//

import SwiftUI

struct AmountWaterView: View {
    @Binding var amountPresented: Bool
    @State var amountSelection = 0
    @ObservedObject var locManager = LocationManager()
    @Binding var defDrink: DefaultDrink
    @StateObject var viewModelStat: StatisticViewModel
   
   @StateObject var viewModel: AmountWaterViewModel = AmountWaterViewModel(defaultDrink: DefaultDrink(name: "", efficiency: 0, caffeine: 0, alcohol: 0))
    var body: some View {
        NavigationView{
        ScrollView{
        VStack{
        Picker("",selection: self.$amountSelection){
            ForEach(25...1000, id: \.self){
                Text("\($0) ml")
            }
        }.pickerStyle(WheelPickerStyle())
            
            Button(action:{
                viewModel.drink.efficiency=viewModel.defaultDrink.efficiency
                viewModel.drink.name = viewModel.defaultDrink.name
                viewModel.drink.amount = amountSelection
                viewModel.drink.alcohol = viewModel.defaultDrink.alcohol
                viewModel.drink.caffeine = viewModel.defaultDrink.caffeine
                viewModel.drink.water = Int(Double( viewModel.defaultDrink.efficiency)/100*Double(amountSelection))
                viewModel.drink.latitude = locManager.location?.coordinate.latitude ?? 0.0
                viewModel.drink.longitude = locManager.location?.coordinate.longitude ?? 0.0
                Database.shared.setDrink(drink: viewModel.drink){
                                            result in
                                            switch result{
                                            case .success(let drink):
                                                print(drink.name)
                                            case .failure(let error):
                                                print(error.localizedDescription)
                                            }
                                    
                                        }
                viewModelStat.getSumByDate(date: Date())
                amountPresented = false
            }){
             Text("To Drink")
                    .foregroundColor(Color.white)
                    .frame(width: 250)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(20)
        }
            
            
        }.onAppear{
            viewModel.defaultDrink = defDrink
        }
        }.navigationTitle(viewModel.defaultDrink.name)
                .preferredColorScheme(.dark)
                .toolbar{
                    ToolbarItemGroup(placement: .navigationBarLeading){
                                    Button("Cancel") {
                                        amountPresented = false
                                    }
                                }
    }
    }
       
}
}

struct AmountWaterView_Previews: PreviewProvider {
    static var previews: some View {
       
        AmountWaterView(amountPresented: .constant(true), defDrink: .constant(DefaultDrink(name: "", efficiency: 0, caffeine: 0, alcohol: 0)), viewModelStat: StatisticViewModel())
    }
    
}

