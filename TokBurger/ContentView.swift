//
//  ContentView.swift
//  TokBurger
//
//  Created by Emre Tokyüz on 15.06.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        StartScreen()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct StartScreen: View {
    @State private var selectedCountry = "USA"
    let countries = ["USA", "Canada", "UK", "Australia"]

    var body: some View {
        VStack {
            Text("TokBurger")
                .font(.title)
                .padding(.top, 50)
            
            Image("burger")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .padding(.top, 50)
            
            Button(action: {
                // Handle order button action
            }) {
                Text("Order")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.top, 50)
            
            Text("Select your country:")
                .font(.headline)
                .padding(.top, 30)
            
            VStack {
                Picker(selection: $selectedCountry, label: Text("")) {
                    ForEach(countries, id: \.self) { country in
                        Text(country)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .frame(width: 200)
                .padding(.top, 10)
                
                Image(systemName: "chevron.down")
                    .font(.system(size: 12, weight: .semibold))
                    .padding(.top, -12)
            }
            
            Spacer()
        }
    }
}

