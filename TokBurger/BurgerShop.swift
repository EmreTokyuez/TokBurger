//
//  BurgerShop.swift
//  TokBurger
//
//  Created by Emre Tokyüz on 21.06.23.
//

import Foundation


import SwiftUI



class BurgerShop: ObservableObject {
    @Published var isCreated = false
    @Published var listOrders: [String: Double] = [:]
    var builder: BurgerBuilder? = nil

    @Published var countryPrices: [String: Double] = [
        "USA": 1.7,
        "Canada": 1.8,
        "UK": 1.2,
        "Australia": 2.2
    ]
    var country: String
    init(country: String) {
        self.country = country
        isCreated = true
    }

    
    func  selectType(type: String) {
       
        if type == "Beef" {
                 builder = BeefBurgerBuilder(country: country)
               }
               if type == "Veggie" {
                   builder = VeggieBurgerBuilder(country: country)
               }
    }
    
    
    func selectIngredients(selectedIngredients: [String]){
        if(selectedIngredients.contains("Lettuce")){
            builder?.addLettuce()
        }
        if(selectedIngredients.contains("HotSauce")){
            builder?.addHotSauce()
        }
        if(selectedIngredients.contains("Tomatoes")){
            builder?.addTomatoes()
        }
        if(selectedIngredients.contains("Pickles")){
            builder?.addPickles()
        }

    }
    
    func createOrder(){
        selectType(type: country)
        
        
        
    }
    
    func deleteOrder(){}
    

    
}








