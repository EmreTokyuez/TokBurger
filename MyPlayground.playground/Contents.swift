import UIKit
import TokBurger

class kaeserdemo {
  static func main() {
      var b = BurgerShop(country: "USA")
//      b.selectType(type: "Beef")
//      b.selectIngredients(selectedIngredients: ["Lettuce", "HotSauce"])
      b.createOrder(t: "Beef", i:["Lettuce", "HotSauce"] )
      print(b.checkout())
  }
}
