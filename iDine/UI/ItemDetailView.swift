//
//   ItemDetail.swift
//  iDine
//
//  Created by Sergio López on 01/02/2020.
//  Copyright © 2020 Sergio López. All rights reserved.
//

import SwiftUI

struct ItemDetail: View {
    
    @EnvironmentObject var order: Order
    @EnvironmentObject var favs: Favourites
      
    var item: MenuItem
    
    var body: some View {
        
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                Text("Photo by: \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)                    
            }
            
            Text(item.description)
                .padding()
            
            Button("Order this") {
                self.order.add(item: self.item)
            }
            .font(.headline)
            .padding(10)
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(CGFloat(5))
            
            Spacer()
            
            Text("Copyright 2020")
                .foregroundColor(.gray)
                .font(.system(size: 14))

        }
        .navigationBarTitle(Text(item.name), displayMode: .inline)

        .navigationBarItems(trailing: Button("Add to favs") {
            self.favs.add(item: self.item)
        })
        
    }
    


}

struct ItemDetail_Previews: PreviewProvider {
    
    static let order = Order()
    
    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example).environmentObject(order)
        }
        
    }
}
