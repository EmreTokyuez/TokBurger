////
////  IngredientSelectionView.swift
////  TokBurger
////
////  Created by Emre Tokyüz on 13.07.23.
////
//
import SwiftUI

struct Ingredient: Identifiable {
    let id = UUID()
    let name: String
    var isSelected: Bool = false
}

struct IngredientSelectionView: View {
    @ObservedObject var shop: BurgerShop
    @State private var ingredients: [Ingredient] = [
        Ingredient(name: "Pickles"),
        Ingredient(name: "Hot Sauce"),
        Ingredient(name: "Tomatoes"),
        Ingredient(name: "Lettuce")
    ]
//    @State private var ingredientprices : [String: Double] = [
//        "Lettuce": 0.9,
//        "Tomatoes": 1.2,
//        "Hot Sauce": 0.9,
//        "Pickles": 2.2
//    ]
    @State private var action3: Int? = 0
        @State private var cartCount = 0

    var body: some View {
        NavigationLink(destination: CheckoutView(shop: shop), tag: 1, selection: $action3) {
            EmptyView()
        }
        VStack(spacing: 20) {
            
            Text("Select your ingredients")
                .font(.title)
            
            List(ingredients) { ingredient in
                HStack {
                    Image(systemName: ingredient.isSelected ? "checkmark.square.fill" : "square")
                        .onTapGesture {
                            toggleIngredientSelection(ingredient)
                        }
                        .foregroundColor(ingredient.isSelected ? .green : .primary)
                    
                    Text(ingredient.name)
                        .font(.headline)
                }
            }
            .listStyle(InsetGroupedListStyle())
            
            Spacer()
            
            HStack {
                           Button(action: {
                                self.action3 = 1
            
                            }) {
                                Image(systemName: "cart")
                                    .foregroundColor(.primary)
                                Text("Cart")
                                    .foregroundColor(.primary)
                                    .padding(.leading, 5)
                                Text("(\(shop.listOrders.count))")
                                    .foregroundColor(.primary)
                            }
                            .padding()
            
                            Spacer()
            
                            Button(action: {
                                self.action3 = 1
                                let selectedIngredients = ingredients.filter { $0.isSelected }.map { $0.name }
                                shop.createOrder(t: shop.patty ?? "Beef", i: selectedIngredients)
            
                            }) {
                                Text("Order")
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.green)
                                    .cornerRadius(10)
                            }
                            .padding()
                        }
                .navigationTitle("Type Selection")
            }
            
        }
        
    
private func toggleIngredientSelection(_ ingredient: Ingredient) {
                                           if let index = ingredients.firstIndex(where: { $0.id == ingredient.id }) {
                                               ingredients[index].isSelected.toggle()
                                           }
                                       }

                                   }

                                   struct IngredientSelectionView_Previews: PreviewProvider {
                                       static var previews: some View {
                                           IngredientSelectionView(shop: BurgerShop())
                                       }
                                   }
