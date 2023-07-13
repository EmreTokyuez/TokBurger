//
//  CheckOutView.swift
//  TokBurger
//
//  Created by Emre Tokyüz on 13.07.23.
//

import SwiftUI

struct OrderElement: Identifiable {
    let id = UUID()
    let patty: String
    let ingredients: [String]
}

struct CheckoutView: View {
    @ObservedObject var shop: BurgerShop

    @State private var orderElements: [OrderElement] = [
        OrderElement(patty: "Beef", ingredients: ["Pickles", "Hot Sauce"]),
        OrderElement(patty: "Veggie", ingredients: ["Tomatoes", "Lettuce"])
    ]

    var body: some View {
        VStack(spacing: 20) {
            Text("Checkout")
                .font(.title)

            ScrollView {
                VStack(spacing: 20) {
                    ForEach(orderElements) { orderElement in
                        VStack {
                            HStack {
                                Image(orderElement.patty.lowercased())
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .padding()

                                VStack(alignment: .leading, spacing: 5) {
                                    ForEach(orderElement.ingredients, id: \.self) { ingredient in
                                        Text(ingredient)
                                            .font(.headline)
                                    }
                                }
                                .padding(.leading, 10)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                        }
                    }
                }
                .padding()
            }

            Spacer()

            HStack {
                Button(action: {
                    // Handle order more button action
                }) {
                    Image(systemName: "cart")
                        .font(.title)
                }
                .padding()

                Spacer()

                Button(action: {
                    // Handle pay button action
                }) {
                    Text("Pay")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                }
                .padding()
            }
            .frame(height: UIScreen.main.bounds.size.height * 0.15)
            .background(Color.white)
            .padding(.horizontal)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1)
            )
            let locale = Locale(identifier: Locale.current.identifier)
            let currency = locale.currencySymbol ?? "$"
            Text("Total: " + String(shop.checkout()) + currency)
                .font(.title)
                .fontWeight(.bold)
        }
        .padding(.bottom, 20)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(shop: BurgerShop())
    }
}

