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
    

    init(country: String) {
        self.description = "Beef Burger (\(country))"
        self.country = country
        self.burgerType = "Beef"
    }

    func cost() -> Double {
        return price;
        
    }
}

