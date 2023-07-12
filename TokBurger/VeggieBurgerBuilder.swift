//
//  VeggieBurgerBuilder.swift
//  TokBurger
//
//  Created by Emre Tokyüz on 12.07.23.
//

import Foundation

class VeggieBurgerBuilder: BurgerBuilder {
     init(country: String) {
         super.init()
        self.burger = VeggieBurger(country: country)
    }
}

