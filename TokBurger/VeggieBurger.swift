//
//  VeggieBurger.swift
//  TokBurger
//
//  Created by Emre Tokyüz on 12.07.23.
//

import Foundation
class VeggieBurger: Burger {
    let description: String
    let country: String
    let burgerType: String?

    init(country: String) {
        self.description = "Veggie Burger (\(country))"
        self.country = country
        self.burgerType = "Veggie"
    }

    func cost() -> Double {
        return 0;
        
    }
}



