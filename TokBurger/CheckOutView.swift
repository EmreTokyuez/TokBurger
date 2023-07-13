////
////  CheckOutView.swift
////  TokBurger
////
////  Created by Emre Tokyüz on 13.07.23.
////
//
//import SwiftUI
//
//struct OrderElement: Identifiable {
//    let id = UUID()
//    let patty: String
//    let ingredients: [String]
//}
//
//struct CheckoutView: View {
//    @ObservedObject var shop: BurgerShop
//
//    var body: some View {
//        VStack(spacing: 20) {
//            Text("Checkout")
//                .font(.title)
//
//            ScrollView {
//                VStack(spacing: 20) {
//                    ForEach(shop.listOrders) { orderElement in
//                        VStack {
//                            HStack {
//                                Image(orderElement.patty.lowercased())
//                                    .resizable()
//                                    .frame(width: 100, height: 100)
//                                    .padding()
//
//                                VStack(alignment: .leading, spacing: 5) {
//                                    ForEach(orderElement.ingredients, id: \.self) { ingredient in
//                                        Text(ingredient)
//                                            .font(.headline)
//                                    }
//                                }
//                                .padding(.leading, 10)
//                            }
//                            .padding()
//                            .background(Color.white)
//                            .cornerRadius(10)
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 10)
//                                    .stroke(Color.gray, lineWidth: 1)
//                            )
//                        }
//                    }
//                }
//                .padding()
//            }
//
//            Spacer()
//
//            HStack {
//                Button(action: {
//                    // Handle order more button action
//                }) {
//                    Image(systemName: "cart")
//                        .font(.title)
//                }
//                .padding()
//
//                Spacer()
//
//                Button(action: {
//                    // Handle pay button action
//                }) {
//                    Text("Pay")
//                        .foregroundColor(.white)
//                        .padding()
//                        .background(Color.green)
//                        .cornerRadius(10)
//                }
//                .padding()
//            }
//            .frame(height: UIScreen.main.bounds.size.height * 0.15)
//            .background(Color.white)
//            .padding(.horizontal)
//            .overlay(
//                RoundedRectangle(cornerRadius: 10)
//                    .stroke(Color.gray, lineWidth: 1)
//            )
//            let locale = Locale(identifier: Locale.current.identifier)
//            let currency = locale.currencySymbol ?? "$"
//            Text("Total: " + String(shop.checkout()) + currency)
//                .font(.title)
//                .fontWeight(.bold)
//        }
//        .padding(.bottom, 20)
//    }
//}
//
//struct CheckoutView_Previews: PreviewProvider {
//    static var previews: some View {
//        CheckoutView(shop: BurgerShop())
//    }
//}
//

import SwiftUI

struct BurgerOrder: Identifiable {
    let id = UUID()
    let burger: Burger
}

struct CheckoutView: View {
    @ObservedObject var shop: BurgerShop
    var migratedOrders = [BurgerOrder]()
    var totalPrice: Double {
        shop.listOrders.reduce(0) { $0 + $1.cost() }
    }
    // Inside your BurgerShop class or wherever you have access to the listOrders array

    func migrateListOrders() {
        var migratedOrders = [BurgerOrder]()
        
        for burger in shop.listOrders {
            let burgerOrder = BurgerOrder(burger: burger)
            migratedOrders.append(burgerOrder)
        }
        
    }

    var body: some View {
        VStack(spacing: 20) {
            List(migratedOrders) { burgerOrder in
                Text(burgerOrder.burger.getOrderDescription())
            }
            
            HStack {
                Spacer()
                
                Text("Total: \(formatPrice(totalPrice))")
                    .font(.headline)
                
                Spacer()
                
                Button(action: {
                    // Pay button action
                    shop.listOrders.removeAll()
                    // Navigate back to ContentView
                }) {
                    Text("Pay")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                }
                
                Spacer()
                
                NavigationLink(destination: SelectView(shop: shop)) {
                    Text("Order More")
                        .foregroundColor(.primary)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                Spacer()
            }
        }
        .navigationTitle("Checkout")
    }
    
    private func formatPrice(_ price: Double) -> String {
        let locale = Locale.current
        let currencySymbol = locale.currencySymbol ?? ""
        let formattedPrice = String(format: "%.2f", price)
        return "\(currencySymbol)\(formattedPrice)"
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(shop: BurgerShop())
    }
}
