import SwiftUI

struct SelectView: View {
    @ObservedObject var shop: BurgerShop
    @State private var selectedPatty: PattyType?
    @State private var cartCount = 0;
    @State private var action2: Int? = 0
    let pattyOptions: [PattyType] = [.beef, .veggie]

    var body: some View {
        NavigationLink(destination: IngredientSelectionView(shop: shop), tag: 1, selection: $action2) {
            EmptyView()
        }
        NavigationLink(destination: CheckoutView(shop: shop), tag: 2, selection: $action2) {
            EmptyView()
        }
        
            VStack(spacing: 20) {
                Spacer()
                Text("Select the Patty")
                    .font(.title)
                Spacer()
                HStack(spacing: 20) {
                    ForEach(pattyOptions, id: \.self) { patty in
                        Button(action: {
                            selectedPatty = patty
                        }) {
                            VStack {
                                Image(patty.imageName)
                                    .resizable()
                                    .frame(width: 125, height: 125)
                                Text(patty.rawValue)
                            }
                            .padding()
                            .background(selectedPatty == patty ? Color.white : Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                        }
                    }
                }
                
                Spacer()
                
                HStack {
                    Button(action: {
                        self.action2 = 2
                    }) {
                        Image(systemName: "cart")
                            .foregroundColor(.primary)
                        Text("Cart")
                            .foregroundColor(.primary)
                            .padding(.leading, 5)
                        Text("(\(shop.listOrders.count))")
                            .foregroundColor(.primary)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        self.action2 = 1
                        if (selectedPatty?.rawValue ?? "beefImage" == "beefImage"){
//                            shop.selectType(type: "Beef")
                            shop.patty = "Beef"

                        }
                        if (selectedPatty?.rawValue ?? "veggieImage" == "veggieImage"){
//                            shop.selectType(type: "Veggie")
                            shop.patty = "Veggie"

                        }

                    }) {
                        Text("Continue")
                            .foregroundColor(selectedPatty != nil ? .yellow : .white)
                            .padding()
                            .background(selectedPatty != nil ? Color.blue : Color.gray)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                    .disabled(selectedPatty == nil)
                }
            }
            .padding()
        .navigationTitle("Patty Selection")
        
    }
}


enum PattyType: String {
    case beef = "Beef Patty"
    case veggie = "Veggie Patty"

    var imageName: String {
        switch self {
        case .beef:
            return "beefImage"
        case .veggie:
            return "veggieImage"
        }
    }
}

struct SelectView_Previews: PreviewProvider {
    static var previews: some View {
        @StateObject var testshop = BurgerShop()
        SelectView(shop: testshop)
    }
}
