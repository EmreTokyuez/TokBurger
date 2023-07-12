//
//  BeefBurgerBuilder.swift
//  TokBurger
//
//  Created by Emre Tokyüz on 12.07.23.
//

import Foundation

class BeefBurgerBuilder: BurgerBuilder {
     init(country: String) {
         super.init()
        self.burger = BeefBurger(country: country)
    }
}

