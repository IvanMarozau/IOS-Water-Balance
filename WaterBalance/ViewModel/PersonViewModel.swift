//
//  PersonViewModel.swift
//  WaterBalance
//
//  Created by Иван Морозов on 28.05.2022.
//

import Foundation

class PersonViewModel: ObservableObject{

@Published var person: Person

init(person: Person){
    self.person = person
}
    func setPerson(){
    Database.shared.setPerson(person: self.person){
        result in
        switch result{
        case .success(let person):
            print(person.height)
        case .failure(let error):
            print(error.localizedDescription)
        }

    }
    }
    
    func getPerson(){
            Database.shared.getPerson{result in
                switch result{
                     
                case .success(let person):
                    self.person = person
                    print("User: \(self.person.height)")
                case .failure(let error):
                    print (error.localizedDescription)
                }
                }
            }
        }

