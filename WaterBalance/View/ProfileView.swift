//
//  ProfileView.swift
//  WaterBalance
//
//  Created by Иван Морозов on 20.05.2022.
//

import SwiftUI

struct ProfileView: View {
    @State var selected = 0
    @State var heightPresented = false
    @State var weightPresented = false
    @StateObject var viewModel: PersonViewModel
    var gender = ["male","female"]
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    Text("Deily norm of water")
                        .padding(10)
                    Text("\(viewModel.person.dailyNormOfWater) ml")
                        .padding(10)
                }.frame(width: 300, height: 110)
                .background(Color.blue)
                    .cornerRadius(20)
                VStack{
                Text("Gender")
                    Picker("",selection: $selected){
                    ForEach(0..<gender.count){index in
                        Text(self.gender[index]).tag(index)
                    }
                    }.onChange(of: selected){newGender in
                        if(selected == 0){
                            viewModel.person.gender = "male"
                        }
                        if(selected == 1){
                            viewModel.person.gender = "female"
                        }
                        viewModel.setPerson()
                    }
                .pickerStyle(SegmentedPickerStyle())
                }
                HStack{
                    VStack{
                        Text("Height")
                            .padding()
                        
                        Text("\(viewModel.person.height) cm")
                    }.onTapGesture {
                        heightPresented = true
                    }
                    .sheet(isPresented: $heightPresented){
                        AddHeightView(heightPresented: $heightPresented, height: $viewModel.person.height, viewModel: viewModel)
                    }
                    .frame(width: 120, height: 90)
                    .background(Color.green)
                        .cornerRadius(20)
                    Spacer()
                    VStack{
                        Text("Weight")
                            .padding()
                        Text("\(viewModel.person.weight) kg")
                    }.onTapGesture {
                        weightPresented = true
                    }
                    .sheet(isPresented: $weightPresented){
                        AddWeightView(weightPresented: $weightPresented, weight: $viewModel.person.weight, normOfWater: $viewModel.person.dailyNormOfWater, viewModel: viewModel)
                    }
                    .frame(width: 120, height: 90)
                    .background(Color.orange)
                        .cornerRadius(20)
                }.padding()
            }.onAppear{
                self.viewModel.getPerson()
            }
            .preferredColorScheme(.dark)
            .navigationTitle(Text("Profile"))
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: PersonViewModel(person: Person(height: 0, weight: 0, dailyNormOfWater: 0, gender: "")))
    }
}
