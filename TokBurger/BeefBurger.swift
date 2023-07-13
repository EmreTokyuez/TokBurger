//
//  BeefBurger.swift
//  TokBurger
//
//  Created by Emre Tokyüz on 12.07.23.
//

import Foundation

class BeefBurger: Burger {
    let description: String
    let country: String
    let burgerType: String?
    var price = 5.0;
    @Published var countryPrices: [String: Double] = [
        "USA": 1.7,
        "Canada": 1.8,
        "UK": 1.2,
        "Australia": 2.2
    ]
    

    init(country: String) {
        self.description = "Beef Burger (\(country))"
        self.country = country
        self.burgerType = "Beef"
    }

    func cost() -> Double {
        return price  * (countryPrices[country] ?? 1);
        
    }
}

