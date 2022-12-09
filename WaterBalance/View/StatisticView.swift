//
//  StatisticView.swift
//  WaterBalance
//
//  Created by Иван Морозов on 04.06.2022.
//

import SwiftUI

struct StatisticView: View {
    @State var statistic:[WaterForDay] = []
    @StateObject var viewModel: StatisticViewModel
    @State var graphView: Bool = false
    
    
    var body: some View {
        NavigationView{
        ScrollView{
            VStack(alignment:.leading){
                ForEach(statistic, id: \.id){
                    item in
                    if(item.weekDay == "Sun"){
                        Text(Calendar.current.date(byAdding: .day, value: -3, to: Date())!,style: .date)
                            .font(.system(size: 12))
                    }
                    else if(item.weekDay == "Sat"){
                        Text(Calendar.current.date(byAdding: .day, value: -4, to: Date())!,style: .date)
                            .font(.system(size: 12))
                    }
                    else if(item.weekDay == "Fri"){
                        Text(Calendar.current.date(byAdding: .day, value: -5, to: Date())!,style: .date)
                            .font(.system(size: 12))
                    }
                    else if(item.weekDay == "Thu"){
                        Text(Calendar.current.date(byAdding: .day, value: -6, to: Date())!,style: .date)
                            .font(.system(size: 12))
                    }
                    else if(item.weekDay == "Wed"){
                        Text(Date(),style: .date)
                            .font(.system(size: 12))
                    }
                    else if(item.weekDay == "Tue"){
                        Text(Calendar.current.date(byAdding: .day, value: -1, to: Date())!,style: .date)
                            .font(.system(size: 12))
                    }
                    else{
                        Text(Calendar.current.date(byAdding: .day, value: -2, to: Date())!,style: .date)
                            .font(.system(size: 12
                                         ))
                    }
                    StatisticsField(waterForDay: item)
                }
            }
        
        }
        .navigationTitle(Text("Statistics"))
        .onAppear {
            
        self.viewModel.getSumByDate(date: Calendar.current.date(byAdding: .day, value: -6, to: Date())!)
                
        self.viewModel.getSumByDate(date: Calendar.current.date(byAdding: .day, value: -5, to: Date())!)
                
        self.viewModel.getSumByDate(date: Calendar.current.date(byAdding: .day, value: -4, to: Date())!)
        self.viewModel.getSumByDate(date: Calendar.current.date(byAdding: .day, value: -3, to: Date())!)
        self.viewModel.getSumByDate(date: Calendar.current.date(byAdding: .day, value: -2, to: Date())!)
        self.viewModel.getSumByDate(date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!)
        self.viewModel.getSumByDate(date: Date())
            statistic = viewModel.buildGraf()
        }
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button("Show chart"){
                    graphView.toggle()
                    statistic = viewModel.buildGraf()
                }
                .foregroundColor(Color.white)
            }
        }
        .sheet(isPresented: $graphView) {
            GraphView(graphView: $graphView, statistic: $statistic)
}
        }
        
}
}

struct StatisticView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticView( viewModel: StatisticViewModel())
    }
}
