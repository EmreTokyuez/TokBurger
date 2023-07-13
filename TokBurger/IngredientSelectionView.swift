//
//  IngredientSelectionView.swift
//  TokBurger
//
//  Created by Emre Tokyüz on 13.07.23.
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

    var body: some View {
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
                    // Handle cart button action
                }) {
                    Image(systemName: "cart")
                        .font(.title)
                }
                .padding()

                Spacer()

                Button(action: {
                    // Handle continue button action
                }) {
                    Text("Continue")
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
        }
        .padding(.bottom, 20)
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

