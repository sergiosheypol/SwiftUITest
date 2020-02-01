//
//  ItemRow.swift
//  iDine
//
//  Created by Sergio López on 01/02/2020.
//  Copyright © 2020 Sergio López. All rights reserved.
//

import SwiftUI

struct ItemRow: View {
    
    var item: MenuItem
    
    var body: some View {
        HStack{
            Image(item.thumbnailImage)
            VStack(alignment: .leading) {
                Text(item.name)
                Text("$\(item.price)")
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
