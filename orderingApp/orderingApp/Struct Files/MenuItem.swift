//
//  MenuItems.swift
//  orderingApp
//
//  Created by Tyler Radke on 12/6/22.
//

import Foundation

struct MenuItem: Codable {
    var id: Int
    var name: String
    var detailText: String
    var price: Double
    var category: String
    var imageURL: URL
    
    enum CodingKeys: String, CodingKey {
        case id, name, detailText = "description", price, category, imageURL = "image_url"
    }
}

