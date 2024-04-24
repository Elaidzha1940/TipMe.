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
    @Binding var billWithTip: String
    @Binding var totalTip: String
    @Binding var tipPercent: Int
    @Binding var originalBill: String
    @Binding var totalBill: String
    @Binding var billPersons: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Group {
                Text("Total per person: \(billWithTip)")
                Text("Grand Total: \(totalBill)")
            }
            .font(.system(size: 20, weight: .semibold, design: .default))
            
            Group {
                Text("Bill: \(originalBill)")
                Text("Your Tip: \(totalTip) (\(tipPercent) %)")
                Text("Split by: \(billPersons)")
            }
            .opacity(0.7)
            .font(.system(size: 16, weight: .medium, design: .default))
            
        }
        .frame(width: 375, height: 175)
        .background(Color("bg").gradient)
        .cornerRadius(20)
        .foregroundStyle(.white)
    }
}

#Preview {
    PriceCardView(
        billWithTip: .constant("10"),
        totalTip: .constant("10"),
        tipPercent: .constant(10),
        originalBill: .constant("0.00"),
        totalBill: .constant("0.00"),
        billPersons: .constant(1))
}
