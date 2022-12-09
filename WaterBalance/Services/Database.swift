//
//  Database.swift
//  WaterBalance
//
//  Created by Иван Морозов on 19.05.2022.
//

import Foundation
import FirebaseFirestore

class Database{
    
    static let shared = Database()
    private let db = Firestore.firestore()
    
    private var defaultDrinksRef: CollectionReference{
        
        return db.collection("DefaultDrinks")
    }
    private var drinksRef: CollectionReference{
        
        return db.collection("Drinks")
    }
    private var personRef: CollectionReference{
        
        return db.collection("Person")
    }
    private init(){}
    
    func getAllDefaultDrinks(complation: @escaping (Result<[DefaultDrink], Error>) -> ()){
        self.defaultDrinksRef.getDocuments{ qSnap, error in
            if let qSnap = qSnap{
                var defaultDrinks = [DefaultDrink]()
                for doc in qSnap.documents{
                    if let defaultDrink = DefaultDrink(doc: doc){
                        defaultDrinks.append(defaultDrink)
                    }
                }
                complation(.success(defaultDrinks))
            }else if let error = error{
                complation(.failure(error))
            }
            
        }
    }
    
    func setDrink(drink: Drink, completion: @escaping (Result<Drink, Error>) ->()){
            
            drinksRef.document(drink.id).setData(drink.representation){
                error in
                if let error = error {
                    completion(.failure(error))
                }else{
                    completion(.success(drink))
                }
            }
            
        }
    
    func getAllDrinks(complation: @escaping (Result<[Drink], Error>) -> ()){
        self.drinksRef.getDocuments{ qSnap, error in
            if let qSnap = qSnap{
                var drinks = [Drink]()
                for doc in qSnap.documents{
                    if let drink = Drink(doc: doc){
                        drinks.append(drink)
                    }
                }
                complation(.success(drinks))
            }else if let error = error{
                complation(.failure(error))
            }
            
        }
    }
    
    func getPerson(completion: @escaping (Result<Person, Error>) ->()){
            personRef.document("HnbvOtLmYSPxLIKRhxTs").getDocument{ docSnapshot, error in
                
                guard let snap = docSnapshot else{ return }
                guard let data = snap.data() else{ return }
                
                guard let id = data["id"] as? String else {return}
                guard let height = data["height"] as? Int else {return}
                guard let weight = data["weight"] as? Int else {return}
                guard let dailyNormOfWater = data["dailyNormOfWater"] as? Int else {return}
                guard let gender = data["gender"] as? String else {return}
                
                
                let person = Person(id: id, height: height, weight: weight, dailyNormOfWater: dailyNormOfWater, gender: gender)
                
                completion(.success(person))
            }
        }
        
        
        func setPerson(person: Person, completion: @escaping (Result<Person, Error>) ->()){
            
            personRef.document(person.id).setData(person.representation){
                error in
                if let error = error {
                    completion(.failure(error))
                }else{
                    completion(.success(person))
                }
            }
            
        }
    
    func getAllDateDrinks(date: Date,complation: @escaping (Result<[Drink], Error>) -> ()){
        self.drinksRef.getDocuments{ qSnap, error in
            if let qSnap = qSnap{
                var drinks = [Drink]()
                for doc in qSnap.documents{
                    if let drink = Drink(doc: doc){
                        drinks.append(drink)
                    }
                }
                complation(.success(drinks))
            }else if let error = error{
                complation(.failure(error))
            }
            
        }
    }
    
    func getAllDrinkByDate(date: Date, completion: @escaping (Result<[Drink], Error>) ->()){
            let formatter = DateFormatter()
            formatter.dateFormat = "dd"
            let day = formatter.string(from: date)
            
            self.drinksRef.getDocuments{ qSnap, error in
                
                if let qSnap = qSnap{
                    var drinks = [Drink]()
                    for doc in qSnap.documents{
                        if let drink = Drink(doc: doc){
                            if(formatter.string(from: drink.date) == day){
                            drinks.append(drink)
                            }
                        }
                    }
                    completion(.success(drinks))
                } else if let error = error{
                    completion(.failure(error))
                }
                
            }
        }
    func deleteDrink(drink: Drink){
        if let documentID = Optional(drink.id){
            drinksRef.document(documentID).delete{error in
                if let error = error{
                    print(error.localizedDescription)
                }
            }
        }
    }
}
