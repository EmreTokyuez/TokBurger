//
//  VeggieBurger.swift
//  TokBurger
//
//  Created by Emre Tokyüz on 12.07.23.
//

import Foundation

class VeggieBurger: Burger {
    override init(country: String) {
        super.init(country: country)
        burgerType = "Veggie"
        description = "Veggie Burger (\(country))"
    }
    //    override func cost() -> Double {
    //        return Main.db.getPrice(self, nil)
    //    }
    
}


