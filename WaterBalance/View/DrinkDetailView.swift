//
//  DrinkDetailView.swift
//  WaterBalance
//
//  Created by Иван Морозов on 28.05.2022.
//

import SwiftUI
import MapKit

struct DrinkDetailView: View {
    @Binding var detailPresented: Bool
    @ObservedObject var viewModel: DrinkDetailViewModel
    @StateObject var viewModelHis: HistoryViewModel
    @Binding var drinkd: Drink
    var body: some View {
        NavigationView{
        ScrollView{
        VStack{
        MapView(drink: viewModel.drink, region: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: viewModel.drink.latitude, longitude: viewModel.drink.longitude), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)))
                .frame(height: 250)
                .cornerRadius(20)
            
            RowDetailDrink(drink: viewModel.drink)
        }
        .onAppear{
            viewModel.drink = drinkd
        }
        .navigationTitle("Details")
        .toolbar{
            ToolbarItemGroup(placement: .navigationBarLeading){
                            Button("Cancel") {
                                detailPresented = false
                            }
                            .foregroundColor(Color.white)
                
                        }
            ToolbarItemGroup(placement: .navigationBarTrailing){
                            Button("delete") {
                                detailPresented = false
                                viewModel.deleteDrink()
                                self.viewModelHis.getAllDrinks()
                            }
                            .foregroundColor(Color.white)
                
                        }
        }
            
        }
        }
    }
    
}

struct DrinkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DrinkDetailView(detailPresented: .constant(true), viewModel: DrinkDetailViewModel(drink: Drink(name: "", efficiency: 0, caffeine: 0, alcohol: 0.0, amount: 0, water: 0, date: Date(), latitude: 0.0, longitude: 0.0)), viewModelHis: HistoryViewModel(), drinkd: .constant(Drink(name: "", efficiency: 0, caffeine: 0, alcohol: 0.0, amount: 0, water: 0, date: Date(), latitude: 0.0, longitude: 0.0)))
    }
}
