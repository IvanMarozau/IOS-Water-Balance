//
//  AddWeightView.swift
//  WaterBalance
//
//  Created by Иван Морозов on 20.05.2022.
//

import SwiftUI

struct AddWeightView: View {
    @Binding var weightPresented: Bool
    @State var weightSelection = 0
    @Binding var weight: Int
    @Binding var normOfWater: Int
    @StateObject var viewModel: PersonViewModel
    var body: some View {
        NavigationView{
        ScrollView{
        VStack{
        Picker("",selection: self.$weightSelection){
            ForEach(50...300, id: \.self){
                Text("\($0) kg")
            }
        }.pickerStyle(WheelPickerStyle())
                
            Button(action:{
                weight = weightSelection
                normOfWater = weight*30
                viewModel.setPerson()
                weightPresented = false
            }){
             Text("Choose")
                    .foregroundColor(Color.white)
                    .frame(width: 250)
                    .padding()
                    .background(Color.orange)
                    .cornerRadius(20)
            }
            
    }
        }.navigationTitle(Text("Weight"))
                .preferredColorScheme(.dark)
                .toolbar{
                    ToolbarItemGroup(placement: .navigationBarLeading){
                                    Button("Cancel") {
                                        weightPresented = false
                                    }
                                }
    }
    }
       
    }
}

struct AddWeightView_Previews: PreviewProvider {
    static var previews: some View {
        AddWeightView(weightPresented: .constant(true), weight: .constant(0), normOfWater: .constant(0), viewModel: PersonViewModel(person: Person(height: 0, weight: 0, dailyNormOfWater: 0, gender: "")))
    }
}
