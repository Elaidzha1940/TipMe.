//  /*
//
//  Projcet: TipMe
//  File: PriceCardView.swift
//  Created by: Elaidzha Shchukin
//  Date: 24.04.2024
//
//  */

import SwiftUI

struct PriceCardView: View {
    var body: some View {
        VStack(spacing: 10) {
            Group {
                Text("Total per person: 800.00")
                Text("Grand Total: : 300.00")
            }
            .font(.system(size: 20, weight: .semibold, design: .default))
           
            Group {
                Text("Bill: 150")
                Text("Your Tip: 50 (20%)")
                Text("Split by: 2")
            }
            .opacity(0.7)
            .font(.system(size: 16, weight: .medium, design: .default))

        }
        .frame(width: 350, height: 175)
        .background(Color("bg"))
        .cornerRadius(20)
        .foregroundStyle(.white)
    }
}

#Preview {
    PriceCardView()
}
