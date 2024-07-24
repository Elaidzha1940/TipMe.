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
    @State var personsToSplitBill = 1
    
    @State var billWithTip: String = "0.00"
    @State var totalBill: String = "0.00" // Grand Total
    @State var tip: String = "0.00"
    
    @State var showAlert: Bool = false
    
    let step = 1
    let range = 1...20
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        formatter.decimalSeparator = "."
        return formatter
    }()
    
    var body: some View {
        
        // MARK: - NavigationStack
        NavigationStack {
            VStack(spacing: 25) {
                PriceCardView(
                    billWithTip: $billWithTip,
                    totalTip: $tip,
                    tipPercent: $selectedTipPercent,
                    originalBill: $bill,
                    totalBill: $totalBill,
                    billPersons: $personsToSplitBill)
                
                VStack(alignment: .leading) {
                    Text("Enter your total bill amount")
                        .font(.system(size: 20, weight: .semibold, design: .default))
                    
                    TextField("", text: $bill)
                        .font(.system(size: 20, weight: .medium, design: .default))
                        .padding(15)
                        .frame(width: 375, height: 50)
                        .background(Color.secondary.opacity(0.3).gradient)
                        .cornerRadius(20)
                }
                
                // MARK: - Picker
                VStack(alignment: .leading) {
                    Text("Select desired Tip percent %")
                        .font(.system(size: 20, weight: .semibold, design: .default))
                    
                    Picker("Tip", selection: $selectedTipPercent) {
                        Text("5$")
                            .tag(5)
                        Text("10$")
                            .tag(10)
                        Text("15$")
                            .tag(15)
                    }
                    .pickerStyle(.segmented)
                }
                
                // MARK: - Stepper
                VStack(alignment: .leading) {
                    Text("Want to split the bill?")
                        .font(.system(size: 20, weight: .semibold, design: .default))
                        .foregroundStyle(.gray)
                    
                    Stepper(value: $personsToSplitBill, in: range, step: step) {
                        HStack {
                            Text("Split by Persons")
                                .font(.system(size: 17, weight: .semibold, design: .default))
                            
                            Text("\(personsToSplitBill)")
                                .font(.system(size: 17, weight: .semibold, design: .default))
                        }
                    }
                }
                
                Button(action: {
                    calculatTip()
                }, label: {
                    Text("Calculate Bill with Tip")
                        .font(.system(size: 18, weight: .semibold, design: .default))
                        .frame(width: 375, height: 50)
                        .background(Color("bg").gradient)
                        .cornerRadius(20)
                        .foregroundStyle(.white)
                })
                
                Button(action: {
                    resetValues()
                    
                    // Optional
                    bill = ""
                    selectedTipPercent = 5
                    personsToSplitBill = 1
                }, label: {
                    Text("Clear")
                        .font(.system(size: 18, weight: .semibold, design: .default))
                        .frame(width: 375, height: 50)
                        .background(Color.secondary.opacity(0.5).gradient)
                        .cornerRadius(20)
                        .foregroundStyle(Color("bg"))
                })
            }
            .navigationTitle("Split the Tip")
            .padding(.leading, 20)
            .padding(.trailing, 20)
            .onChange(of: bill) { newValue in
                if newValue.isEmpty{
                    resetValues()
                }
            }
            .onChange(of: selectedTipPercent) { _ in
                resetValues()
            }
            .alert("Please enter a valid number", isPresented: $showAlert) {
                Button("OK", role: .cancel) {}
            }
        }
    }
    
    func calculatTip() -> () {
        guard let billAmountNumber = formatter.number(from: bill) else {
            showAlert = true
            return
        }
        
        let billAmount = Float(truncating: billAmountNumber)
        let tipPercentage = Float(selectedTipPercent) / 100.0
        let tipAmount = billAmount * tipPercentage
        let totalBillWithTip = billAmount + tipAmount
        
        var billWithTip: Float = 0.0
        
        if personsToSplitBill > 1 {
            billWithTip = totalBillWithTip / Float(personsToSplitBill)
        } else {
            billWithTip = totalBillWithTip
        }
        
        self.billWithTip = formatter.string(from: NSNumber(value: billWithTip)) ?? "0.00"
        self.totalBill = formatter.string(from: NSNumber(value: totalBillWithTip)) ?? "0.00"
        self.tip = formatter.string(from: NSNumber(value: tipAmount)) ?? "0.00"
    }
    
    func resetValues() -> () {
        billWithTip = "0.00"
        totalBill = "0.00"
        tip = "0.00"
    }
}

#Preview {
    ContentView()
}
