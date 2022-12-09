//
//  AddHeightView.swift
//  WaterBalance
//
//  Created by Иван Морозов on 20.05.2022.
//

import SwiftUI

struct AddHeightView: View {
    @Binding var heightPresented: Bool
    @State var heightSelection = 0
    @Binding var height: Int
    @StateObject var viewModel: PersonViewModel
    var body: some View {
        NavigationView{
        ScrollView{
        VStack{
        Picker("",selection: self.$heightSelection){
            ForEach(50...300, id: \.self){
                Text("\($0) cm")
            }
        }.pickerStyle(WheelPickerStyle())
                
            Button(action:{
                height = heightSelection
                viewModel.setPerson()
                heightPresented = false
            }){
             Text("Choose")
                    .foregroundColor(Color.white)
                    .frame(width: 250)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(20)
            }
            
    }
        }.navigationTitle(Text("Height"))
                .preferredColorScheme(.dark)
                .toolbar{
                    ToolbarItemGroup(placement: .navigationBarLeading){
                                    Button("Cancel") {
                                        heightPresented = false
                                    }
                                }
    }
    }
       
}
    }

struct AddHeightView_Previews: PreviewProvider {
    static var previews: some View {
        AddHeightView(heightPresented: .constant(true), height: .constant(0), viewModel: PersonViewModel(person: Person(height: 0, weight: 0, dailyNormOfWater: 0, gender: "")))
    }
}
