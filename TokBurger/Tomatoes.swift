//
//  Tomatoes.swift
//  TokBurger
//
//  Created by Emre Tokyüz on 12.07.23.
//

import Foundation
class Tomatoes: BurgerDecorator {
    var description: String
    
    

    let burger: Burger

    init(burger: Burger) {
        self.burger = burger
        self.description = ""
    }


    var country: String {
        return burger.country
    }

    var burgerType: String? {
        return burger.burgerType
    }

    func cost() -> Double {
        return burger.cost()
    }
    func getDescription() -> String {
        return burger.description + ", Tomatoes"

    }
}
