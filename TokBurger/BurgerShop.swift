//
//  BurgerShop.swift
//  TokBurger
//
//  Created by Emre Tokyüz on 21.06.23.
//

import Foundation


class BurgerShop {
    var listorders: [String: Double] = [:]
    var countryPrices: [String: Double] = [
        "USA": 1.7,
        "Canada": 1.8,
        "UK": 1.2,
        "Australia": 2.2
    ]
    var country: String
    
    init(country: String) {
        self.country = country
    }
    
    func selectType(type: String) {
        if type == "Beef" {
            // Code for beef type
            builder = BeefBurgerBuilder(country: country)
        }
        if type == "Veggie" {
            // Code for veggie type
            builder = VeggieBurgerBuilder(country: country)
        }
    }

}


