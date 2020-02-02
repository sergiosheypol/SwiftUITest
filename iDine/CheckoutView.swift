//
//  CheckoutView.swift
//  iDine
//
//  Created by Sergio López on 02/02/2020.
//  Copyright © 2020 Sergio López. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    
    @EnvironmentObject var order: Order
    
    static let paymentTypes = ["Cash", "Credit card", "iDine points", "Paypal"]
    static let tipAmounts = [0, 10, 20, 25]
    
    
    
    @State private var paymentType = 0
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 0
    
    var totalPrice: Double {
        let total = Double(order.total)
        let tip = total * Double(Self.tipAmounts[self.tipAmount]) / 100
        
        return total + tip
    }
    
    var body: some View {
        Form  {
            Section {
                Picker("How do you want to pay?",  selection: $paymentType) {
                    ForEach(0 ..< Self.paymentTypes.count) {
                        Text(Self.paymentTypes[$0])
                    }
                    
//                    ForEach(0 ..< Self.paymentTypes.count, content: { index in
//                        Text(Self.paymentTypes[index])
//                    })
                }
                
                Toggle(isOn: $addLoyaltyDetails.animation() ) {
                    Text("Add iDine loyalty card")
                }
                
//                Toggle(isOn: $addLoyaltyDetails, label: {
//                    () -> Text in Text("fsfs")
//                })
//
//                Toggle(isOn: $addLoyaltyDetails, label: {
//                    () in Text("fsfs")
//                })
                if addLoyaltyDetails {
                    TextField("Enter your iDine ID", text: $loyaltyNumber)
                }
                
                
            }
            
            Section(header: Text("Add a tip")) {
                Picker("Percentage: ", selection: $tipAmount) {
                    ForEach(0 ..< Self.tipAmounts.count) {
                        Text("$\(Self.tipAmounts[$0])")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("TOTAL: $\(totalPrice, specifier: " %.2f")")) {
                Button("Confirm order") {
                    // Place order
                }
            }
            
        }.navigationBarTitle(Text("Payment"), displayMode: .inline)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    
    static let order = Order()
    
    static var previews: some View {
        CheckoutView().environmentObject(order)
    }
}
