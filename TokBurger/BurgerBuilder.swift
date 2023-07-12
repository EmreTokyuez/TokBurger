
import Foundation

protocol BurgerBuilder {
//    var burger: Burger?

//    func checkPickles() -> Bool
//    func checkHotsauce() -> Bool
//    func checkTomatoes() -> Bool
//    func checkLettuce() -> Bool



    func addTomatoes()
    //        self.burger = Tomatoes(burger: burger)

    func addHotSauce()
    //        self.burger = HotSauce(burger: burger)

    func addLettuce()
    //        self.burger = Lettuce(burger: burger)

    func addPickles()
    //        self.burger = Pickles(burger: burger)


    func getBurger() -> Burger?
//        return self.burger

}

