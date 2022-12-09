//
//  BottomTabBar.swift
//  WaterBalance
//
//  Created by Иван Морозов on 15.05.2022.
//

import SwiftUI

struct BottomTabBar: View {
    var body: some View {
        TabView{
            DefaultDrinkView(viewModel:DefaultDrinksViewModel(), viewModelStat: StatisticViewModel(), viewModelPerson: PersonViewModel(person: Person(height: 0, weight:0, dailyNormOfWater: 0, gender: "")))
                .tabItem{
                    Image(systemName: "plus")
                    Text("Drinks")
                }
            HistoryView(viewModelHis: HistoryViewModel())
                .tabItem{
                    Image(systemName: "clock")
                    Text("History")
                }
            StatisticView(viewModel: StatisticViewModel())
                .tabItem{
                    Image(systemName: "chart.bar.fill")
                    Text("Statistics")
                }
            ProfileView(viewModel: PersonViewModel(person: Person(height: 0, weight: 0, dailyNormOfWater: 0, gender: "")))
                .tabItem{
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
    }
}

struct BottomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomTabBar()
    }
}
