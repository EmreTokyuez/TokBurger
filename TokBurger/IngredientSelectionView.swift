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

//struct IngredientSelectionView: View {
//    @State private var selectedPatty2: PattyType2?
//    @State private var cartCount = 0
//    @State private var action3: Int? = 0
//
//    let pattyOptions: [PattyType2] = [.beef, .veggie]
//
//    var body: some View {
//        NavigationLink(destination: CheckoutView(), tag: 1, selection: $action3) {
//            EmptyView()
//        }
//        NavigationLink(destination: CheckoutView(), tag: 2, selection: $action3) {
//            EmptyView()
//        }
//
//            VStack(spacing: 20) {
//                Text("Select the Patty")
//                    .font(.title)
//                Spacer()
//                HStack(spacing: 20) {
//                    ForEach(pattyOptions, id: \.self) { patty in
//                        Button(action: {
//                            selectedPatty2 = patty
//                        }) {
//                            VStack {
//                                Image(patty.imageName)
//                                    .resizable()
//                                    .frame(width: 125, height: 125)
//                                Text(patty.rawValue)
//                            }
//                            .padding()
//                            .background(selectedPatty2 == patty ? Color.yellow : Color.white)
//                            .cornerRadius(10)
//                            .shadow(radius: 5)
//                        }
//                    }
//                }
//
//                Spacer()
//
//                HStack {
//                    Button(action: {
//                        self.action3 = 2
//                    }) {
//                        Image(systemName: "cart")
//                            .foregroundColor(.primary)
//                        Text("Cart")
//                            .foregroundColor(.primary)
//                            .padding(.leading, 5)
//                        Text("(\(cartCount))")
//                            .foregroundColor(.primary)
//                    }
//
//                    Spacer()
//
//                    Button(action: {
//                        self.action3 = 1
//                    }) {
//                        Text("Continue")
//                            .foregroundColor(selectedPatty2 != nil ? .white : .gray)
//                            .padding()
//                            .background(selectedPatty2 != nil ? Color.blue : Color.gray)
//                            .cornerRadius(10)
//                            .shadow(radius: 5)
//                    }
//                    .disabled(selectedPatty2 == nil)
//                }
//            }
//            .padding()
//        .navigationTitle("Type Selection")
//
//    }
//}
//
//
//enum PattyType2: String {
//    case beef = "Beef Patty"
//    case veggie = "Veggie Patty"
//
//    var imageName: String {
//        switch self {
//        case .beef:
//            return "beefImage"
//        case .veggie:
//            return "veggieImage"
//        }
//    }
//}
//
//struct IngredientSelectionView_Previews: PreviewProvider {
//    static var previews: some View {
//        @StateObject var testshop = BurgerShop()
//        SelectView(shop: testshop)
//    }
//}




//    @State private var action3: Int? = 0
//
//    var body: some View {
//        NavigationLink(destination: CheckoutView(), tag: 2, selection: $action3) {
//            EmptyView()
//        }
//        VStack(spacing: 20) {
//
//            Text("Select your ingredients")
//                .font(.title)
//
//            List(ingredients) { ingredient in
//                HStack {
//                    Image(systemName: ingredient.isSelected ? "checkmark.square.fill" : "square")
//                        .onTapGesture {
//                            toggleIngredientSelection(ingredient)
//                        }
//                        .foregroundColor(ingredient.isSelected ? .green : .primary)
//
//                    Text(ingredient.name)
//                        .font(.headline)
//                }
//            }
//            .listStyle(InsetGroupedListStyle())
//
//            Spacer()
//
//            HStack {
//                Button(action: {
//                    self.action3 = 2
//
//                }) {
//                    Image(systemName: "cart")
//                        .font(.title)
//                }
//                .padding()
//
//                Spacer()
//
//                Button(action: {
//                    self.action3 = 2
//
//                }) {
//                    Text("Continue")
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
//        }
//        .padding(.bottom, 20).navigationTitle("Ingredient Selection")
//    }
//
//    private func toggleIngredientSelection(_ ingredient: Ingredient) {
//        if let index = ingredients.firstIndex(where: { $0.id == ingredient.id }) {
//            ingredients[index].isSelected.toggle()
//        }
//    }
//
//}
//
//struct IngredientSelectionView_Previews: PreviewProvider {
//    static var previews: some View {
//        IngredientSelectionView()
//    }
//}
//
