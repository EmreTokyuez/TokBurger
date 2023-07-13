import SwiftUI

struct SelectView: View {
    @State private var selectedPatty: PattyType?
    @State private var cartCount = 0

    let pattyOptions: [PattyType] = [.beef, .veggie]

    var body: some View {
        VStack(spacing: 20) {
            Text("Select the Patty")
                .font(.title)

            HStack(spacing: 20) {
                ForEach(pattyOptions, id: \.self) { patty in
                    Button(action: {
                        selectedPatty = patty
                    }) {
                        VStack {
                            Image(patty.imageName)
                                .resizable()
                                .frame(width: 100, height: 100)
                            Text(patty.rawValue)
                        }
                        .padding()
                        .background(selectedPatty == patty ? Color.yellow : Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    }
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
        SelectView()
    }
}
