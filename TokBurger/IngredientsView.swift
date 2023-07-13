import SwiftUI

struct IngredientsView: View {
    @State private var selectedIngredients: Set<String> = []
    @State private var cartCount = 0


    let ingredients: [String] = [
        "Pickles",
        "Hot Sauce",
        "Tomatoes",
        "Lettuce"
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Select Your Ingredients")
                .font(.title)
            
            ForEach(ingredients, id: \.self) { ingredient in
                HStack {
                    Image(systemName: selectedIngredients.contains(ingredient) ? "checkmark.square.fill" : "square")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.blue)
                        .onTapGesture {
                            toggleIngredientSelection(ingredient)
                        }
                    
                    Text(ingredient)
                }
            }
            
            HStack {
                Button(action: {
                    // Handle cart button action
                }) {
                    Image(systemName: "cart")
                        .foregroundColor(.primary)
                    Text("Cart")
                        .foregroundColor(.primary)
                        .padding(.leading, 5)
                    Text("(\(cartCount))")
                        .foregroundColor(.primary)
                }
                
                Spacer()
                
                
                Button(action: {
                    // Handle continue button action
                }) {
                    Text("Continue")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
            }
            .padding()
        }
    }

    private func toggleIngredientSelection(_ ingredient: String) {
        if selectedIngredients.contains(ingredient) {
            selectedIngredients.remove(ingredient)
        } else {
            selectedIngredients.insert(ingredient)
        }
    }
}

struct IngredientsView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsView()
    }
}
