//
//  VeggieBurgerBuilder.swift
//  TokBurger
//
//  Created by Emre Tokyüz on 12.07.23.
//

import Foundation

//
//  BeefBurgerBuilder.swift
//  TokBurger
//
//  Created by Emre Tokyüz on 12.07.23.
//

import Foundation

class VeggieBurgerBuilder: BurgerBuilder {
    private var burger: Burger?

    init(country: String) {
        self.burger = VeggieBurger(country: country)
    }

    func addTomatoes() {
        guard let burger = burger else { return }
        self.burger = Tomatoes(burger: burger)
    }

    func addHotSauce() {
        guard let burger = burger else { return }
        self.burger = HotSauce(burger: burger)
    }

    func addLettuce() {
        guard let burger = burger else { return }
        self.burger = Lettuce(burger: burger)
    }

    func addPickles() {
        guard let burger = burger else { return }
        self.burger = Pickles(burger: burger)
    }

    func getBurger() -> Burger? {
        return burger
    }
}




