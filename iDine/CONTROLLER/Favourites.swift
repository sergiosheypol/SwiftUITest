//
//  File.swift
//  iDine
//
//  Created by Sergio López on 03/02/2020.
//  Copyright © 2020 Sergio López. All rights reserved.
//

import SwiftUI

class Favourites: ObservableObject {
    
    @Published var favs = [MenuItem]()
    
    func add(item: MenuItem) {
        favs.append(item)
    }
    
    func remove(item: MenuItem) {
        if let index = favs.firstIndex(of: item) {
            favs.remove(at: index)
        }
    }
}
