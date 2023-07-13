import SwiftUI

struct SelectView: View {
    @ObservedObject var shop: BurgerShop
    @State private var selectedPatty: PattyType?
    @State private var cartCount = 0
    @State private var action: Int? = 0

    let pattyOptions: [PattyType] = [.beef, .veggie]

    var body: some View {
        NavigationLink(destination: IngredientsView(), tag: 1, selection: $action) {
            EmptyView()
        }
        NavigationLink(destination: CheckoutView(), tag: 2, selection: $action) {
            EmptyView()
        }
        VStack(spacing: 20) {
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
                        .background(selectedPatty == patty ? Color.yellow : Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    }
                }
            }

            Spacer()

            HStack {
                Button(action: {
                    self.action = 2
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
                    self.action = 1
                }) {
                    Text("Continue")
                        .foregroundColor(selectedPatty != nil ? .white : .gray)
                        .padding()
                        .background(selectedPatty != nil ? Color.blue : Color.gray)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
                .disabled(selectedPatty == nil)
            }
        }
        .padding()
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
        var test
        SelectView(shop: testshop)
    }
}
