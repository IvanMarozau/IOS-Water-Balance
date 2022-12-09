//
//  HistoryView.swift
//  WaterBalance
//
//  Created by Иван Морозов on 28.05.2022.
//

import SwiftUI

struct HistoryView: View {
    @State var detailPresented = false
    @StateObject var viewModelHis: HistoryViewModel
    @State var drink: Drink = Drink(name: "", efficiency: 0, caffeine: 0, alcohol: 0.0, amount: 0, water: 0, date: Date(), latitude: 0.0, longitude: 0.0)
    var body: some View {
        NavigationView{
            ScrollView{
                ForEach(viewModelHis.drinks, id: \.id){
                    item in
                        Button{
                            detailPresented = true
                            drink = item
                    }label:{
                        RowDrinksField(drink: item)
                            .foregroundColor(.white)
                            .sheet(isPresented: $detailPresented){
                                let viewModel = DrinkDetailViewModel(drink: drink)
                                DrinkDetailView(detailPresented: $detailPresented, viewModel:viewModel, viewModelHis: viewModelHis, drinkd: $drink)
                            }
            
                    }
                }
            }
                .navigationTitle(Text("History"))
                    .preferredColorScheme(.dark)
                    .onAppear{
                        self.viewModelHis.getAllDrinks()
                    }
        }
    }
}


struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(viewModelHis: HistoryViewModel())
    }
}
