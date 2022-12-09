//
//  StatisticsView.swift
//  WaterBalance
//
//  Created by Иван Морозов on 29.05.2022.
//

import SwiftUI

struct GraphView: View {
//@StateObject var viewModel: BarGraphViewModel
    @Binding var graphView: Bool
    @Binding var statistic:[WaterForDay]
    @State var stat:[WaterForDay] = []
    
   
    var body: some View {
        NavigationView{
        ScrollView{
            VStack{
                BarGraph(stat: $stat)
            }
            .onAppear {
                self.stat = statistic
            }
            .padding()
            .background(.gray.opacity(0.2))
            .cornerRadius(10)
        }
        .navigationTitle(Text("Chart"))
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarLeading) {
                Button("Cancel"){
                    graphView.toggle()
                }
                .foregroundColor(Color.white)
                
            }
        }
    }
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        GraphView(graphView: .constant(true), statistic: .constant([]))
    }
}
