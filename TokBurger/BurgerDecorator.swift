//
//  BurgerDecorator.swift
//  TokBurger
//
//  Created by Emre Tokyüz on 12.07.23.
//

import Foundation

protocol BurgerDecorator: Burger {
    var burger: Burger { get }

    func getDescription() -> String
}

extension BurgerDecorator {
    func cost() -> Double {
//        return burger.cost() + (Main.db.getPrice(self, nil) ?? 0)
        return 0;
    }
}
