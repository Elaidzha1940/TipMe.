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
    @State var selectedTipPercent = 5
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 25) {
                PriceCardView()
                
                VStack(alignment: .leading) {
                    Text("Enter your total bill amount")
                        .font(.system(size: 20, weight: .semibold, design: .default))
                    
                    TextField("", text: $bill)
                        .font(.system(size: 20, weight: .medium, design: .default))
                        .padding(.horizontal, 10)
                        .frame(width: 350, height: 50)
                        .background(Color.secondary.opacity(0.3))
                        .cornerRadius(20)
                    
                    Text("Select desired Tip percent %")
                        .font(.system(size: 20, weight: .semibold, design: .default))
                }
                
                Picker("Tip", selection: $selectedTipPercent) {
                    Text("5$")
                    Text("10$")
                    Text("15$")
                }
                .pickerStyle(.segmented)
            }
            .navigationTitle("Tip Me")
        }
    }
}

#Preview {
    ContentView()
}
