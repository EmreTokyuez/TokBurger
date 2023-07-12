//
//  BurgerBuilder.swift
//  TokBurger
//
//  Created by Emre Tokyüz on 12.07.23.
//

import Foundation
class BurgerBuilder {
    var burger: Burger

    init(burger: Burger) {
        self.burger = burger
    }

    func checkHotSauce() -> Bool {
        if Main.db.getPrice(burger, HotSauce.self) == nil {
            return false
        } else {
            return true
        }
    }

    func addHotSauce() {
        burger = HotSauce(burger: burger)
    }

    func checkJalapenos() -> Bool {
        if Main.db.getPrice(burger, Jalapenos.self) == nil {
            return false
        } else {
            return true
        }
    }

    func addJalapenos() {
        burger = Jalapenos(burger: burger)
    }

    func checkSalad() -> Bool {
        if Main.db.getPrice(burger, Salad.self) == nil {
            return false
        } else {
            return true
        }
    }

    func addSalad() {
        burger = Salad(burger: burger)
    }

    func checkFries() -> Bool {
        if Main.db.getPrice(burger, Fries.self) == nil {
            return false
        } else {
            return true
        }
    }

    func addFries() {
        burger = Fries(burger: burger)
    }

    func getBurger() -> Burger {
        return burger
    }
}
