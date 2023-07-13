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
    @State private var ingredients: [Ingredient] = [
        Ingredient(name: "Pickles"),
        Ingredient(name: "Hot Sauce"),
        Ingredient(name: "Tomatoes"),
        Ingredient(name: "Lettuce")
    ]
    @State private var action3: Int? = 0
        @State private var cartCount = 0

    var body: some View {
        NavigationLink(destination: CheckoutView(), tag: 1, selection: $action3) {
            EmptyView()
        }
        NavigationLink(destination: CheckoutView(), tag: 2, selection: $action3) {
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
                                self.action3 = 2
            
                            }) {
                                Image(systemName: "cart")
                                    .font(.title)
                            }
                            .padding()
            
                            Spacer()
            
                            Button(action: {
                                self.action3 = 2
            
                            }) {
                                Text("Continue")
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
                                           IngredientSelectionView()
                                       }
                                   }
