//
//  Burger.swift
//  TokBurger
//
//  Created by Emre Tokyüz on 12.07.23.
//

import Foundation

protocol Burger {
    var description: String { get }
    var country: String { get }
    var burgerType: String? { get }
    

    func cost() -> Double
    func getOrderDescription() -> String
}


extension Burger {
    func getOrderDescription() -> String {
        let costString = String(format: "%.2f", cost())
        let locale = Locale(identifier: Locale.current.identifier)
        let currency = locale.currencySymbol ?? ""
        return "\(description): \(costString) \(currency)"
    }
}
