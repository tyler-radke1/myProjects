//
//  File.swift
//  orderingApp
//
//  Created by Tyler Radke on 12/7/22.
//

import Foundation
struct MenuResponse: Codable {
    let items: [MenuItem]
}


struct CategoryResponse: Codable {
    let categories: [String]
}


struct OrderResponse: Codable {
    let prepTime: Int
    
    enum CodingKeys: String, CodingKey {
        case prepTime = "preparation_time"
    }
}

