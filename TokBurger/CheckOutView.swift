////
////  CheckOutView.swift
////  TokBurger
////
////  Created by Emre Tokyüz on 13.07.23.
////

import SwiftUI



struct CheckoutView: View {
    @ObservedObject var shop: BurgerShop
    @State private var action4: Int? = 0

    var totalPrice: Double {
        shop.listOrders.reduce(0) { $0 + $1.cost() }
    }


    var body: some View {
        NavigationLink(destination: SelectView(shop: shop), tag: 1, selection: $action4) {
            EmptyView()
        }
        NavigationLink(destination: ContentView(), tag: 2, selection: $action4) {
            EmptyView()
        }
        VStack(spacing: 20) {
            List(shop.listOrders, id: \.self.description) { order in
                Text(order.getOrderDescription())

            }
//            List(migratedOrders) { burgerOrder in
//                Text(burgerOrder.burger.getOrderDescription())
//            }
            
            HStack {
                Spacer()
                
                Text("Total: \(formatPrice(totalPrice))")
                    .font(.headline)
                
                Spacer()
                HStack{
                Button(action: {
                    self.action4 = 2
                }) {
                    Text("Pay")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                }
                    Button(action: {
                        
                        self.action4 = 1
                    }) {
                        Text("Order More")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    
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
