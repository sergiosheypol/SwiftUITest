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
    @State private var paymentType = 0
    
    static let tipAmounts = [0, 10, 20, 25]
    
    static let pickupTimes = ["Now", "Tonight", "Tomorrow morning"]
    @State private var pickupTime = 0
    
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 0
    @State private var showingAlert = false
    
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
            
            Section {
                Picker("Choose your pickup time", selection: $pickupTime) {
                    ForEach(0..<Self.pickupTimes.count) {
                        Text(Self.pickupTimes[$0])
                    }
                }
            }
            
            Section(header: Text("Add a tip")) {
                Picker("Percentage: ", selection: $tipAmount) {
                    ForEach(0 ..< Self.tipAmounts.count) {
                        Text("$\(Self.tipAmounts[$0])")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("TOTAL: $\(totalPrice, specifier: "%.2f")").font(.largeTitle)) {
                Button("Confirm order") {
                    self.showingAlert.toggle()
                    
                    self.order.items.map {
                        self.order.remove(item: $0)
                    }
    
                }
            }
            
        }.navigationBarTitle(Text("Payment"), displayMode: .inline)
         .alert(isPresented: $showingAlert) {
            Alert(title: Text("Order confirmed"),
                  message: Text("Your total price was $\(totalPrice ,specifier: "%.2f") - Thank you!"),
                  dismissButton: .default(Text("OK")) )
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    
    static let order = Order()
    
    static var previews: some View {
        CheckoutView().environmentObject(order)
    }
}
