//
//  OrderView.swift
//  iDine
//
//  Created by Sergio López on 01/02/2020.
//  Copyright © 2020 Sergio López. All rights reserved.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(order.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }
                }
                Section {
                    NavigationLink (destination: Text("Checkout")) {
                        Text("Place order")
                    }
                }
            }.navigationBarTitle("Order").listStyle(GroupedListStyle())
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    
    static let order = Order()
    
    static var previews: some View {
        OrderView().environmentObject(order)
    }
}
