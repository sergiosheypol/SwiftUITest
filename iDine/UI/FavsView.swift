//
//  FavsView.swift
//  iDine
//
//  Created by Sergio López on 03/02/2020.
//  Copyright © 2020 Sergio López. All rights reserved.
//

import SwiftUI

struct FavsView: View {
    
    @EnvironmentObject var favs: Favourites
    
    
    var body: some View {
        NavigationView {
            List{
                Section {
                    ForEach(favs.favs) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }.onDelete(perform: deleteItems)
                }
            }.navigationBarTitle("Favs")
            .listStyle(GroupedListStyle())
            .navigationBarItems(trailing: EditButton())
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        favs.favs.remove(atOffsets: offsets)
    }
}

struct FavsView_Previews: PreviewProvider {
    static let favs = Favourites()
    
    static var previews: some View {
        FavsView().environmentObject(favs)
    }
}
