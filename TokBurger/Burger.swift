//
//  Burger.swift
//  TokBurger
//
//  Created by Emre Tokyüz on 12.07.23.
//

import Foundation

class Burger {
    public var description: String
    public var country: String
    public var burgerType: String;

    // Constructor for Builder
    init(country: String) {
        self.country = country
        self.burgerType = ""
        self.description = ""
    }

    // Constructor for Decorator
    init(burgerType: String, country: String) {
        self.country = country
        self.burgerType = burgerType
        self.description = ""
    }

//    func cost() -> Double {
//        fatalError("Must override cost() in subclass")
//    }
//
//    func getDescription() -> String {
//        return description
//    }
//
//    func getCountry() -> Country {
//        return country
//    }
//
//    func getBurgerType() -> BurgerType {
//        return burgerType
//    }
//
//    func getOrderDescription() -> String {
//        let currency = Main.db.getInfo(self, "currency")
//        return "\(getDescription()): \(String(format: "%.2f", cost())) \(currency)"
//    }
}
