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
        var builder: BurgerBuilder? = nil

        if type == "Beef" {
            builder = BeefBurgerBuilder(country: country)
        }
        if type == "Veggie" {
            builder = VeggieBurgerBuilder(country: country)
        }

    }


}


