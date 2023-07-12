//
//  VeggieBurgerBuilder.swift
//  TokBurger
//
//  Created by Emre Tokyüz on 12.07.23.
//

import Foundation

class VeganBurgerBuilder: BurgerBuilder {
    init(country: Country) {
        burger = VeganBurger(country: country)
    }
}
