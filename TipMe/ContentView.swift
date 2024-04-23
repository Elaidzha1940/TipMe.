//  /*
//
//  Project: TipMe
//  File: ContentView.swift
//  Created by: Elaidzha Shchukin
//  Date 23.04.2024
//
//  */

import SwiftUI

struct ContentView: View {
    @State var bill: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                PriceCardView()
                
                Text("Enter your total bill amount")
                    .font(.system(size: 20, weight: .semibold, design: .default))

                TextField("", text: $bill)
                    .frame(width: 350, height: 50)
                    .background(Color.secondary.opacity(0.3))
                    .cornerRadius(20)
            }
            .navigationTitle("Tip Me")
        }
    }
}

#Preview {
    ContentView()
}
