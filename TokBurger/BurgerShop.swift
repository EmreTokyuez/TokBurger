//
//  BurgerShop.swift
//  TokBurger
//
//  Created by Emre Tokyüz on 21.06.23.
//

import Foundation


import SwiftUI



public  class BurgerShop: ObservableObject {
    @Published var country: String?
    @Published var listOrders = [any Burger]();
    var builder: BurgerBuilder? = nil
    var isToGo = false
    

    @Published var countryPrices: [String: Double] = [
        "USA": 1.7,
        "Canada": 1.8,
        "UK": 1.2,
        "Australia": 2.2
    ]
    public init() {
    }
    public init(country: String) {
        self.country = country
    }
    init(country: String, b: Bool) {
        self.country = country
        isToGo = b
    }

    
    func  selectType(type: String) {
       
        if type == "Beef" {
            builder = BeefBurgerBuilder(country: country ?? "USA")
               }
               if type == "Veggie" {
                   builder = VeggieBurgerBuilder(country: country ?? "USA")
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
    
    func createOrder(t: String, i: [String]){
        selectType(type: t)
        selectIngredients(selectedIngredients: i)
        listOrders.append((builder?.getBurger())!)
        
        
        
        
    }
    
    func createOrder(t: String, i: [String], b: Bool){
        selectType(type: t)
        selectIngredients(selectedIngredients: i)
        isToGo = b
        listOrders.append((builder?.getBurger())!)
        
        
        
        
    }

    func checkout() -> Double{
        var  total = 0.0
        listOrders.forEach {
            total += $0.cost() 
            
        }
        print("To go?: ")
        print(isToGo)
        return total
        }
    func getorders(){
        listOrders.forEach {
            print($0.getOrderDescription())
        }
    }
        
    
    func deleteOrder(t: String, i: [String]) {
        if let index = self.listOrders.firstIndex(where: { $0.burgerType == t && i.allSatisfy($0.getOrderDescription().contains) }) {
            self.listOrders.remove(at: index)
            print("Order deleted.")
        } else {
            print("Order not found.")
        }
    }


}
    

    









