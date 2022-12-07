//
//  Order.swift
//  orderingApp
//
//  Created by Tyler Radke on 12/7/22.
//

import Foundation


struct Order: Codable {
    var menuItems: [MenuItem]
    
    init(menuItems: [MenuItem] = []) {
        self.menuItems = menuItems
    }
}
