//
//  StoreItem.swift
//  iTunesSearch
//
//  Created by Tyler Radke on 12/1/22.
//

import Foundation
import UIKit

struct StoreItem: Codable {
    
    var name: String
    var artist: String
    var kind: String
    var artworkURL: URL
   
    
    var description: String
    
    enum CodingKeys: String, CodingKey {
        case name = "trackName"
        case artist = "artistName"
        case kind
       case artworkURL = "artworkUrl100"
       case description = "shortDescription"
    }
    
    enum AdditionalKeys: String, CodingKey {
        case longDescription
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.artist = try container.decode(String.self, forKey: .artist)
        self.kind = try container.decode(String.self, forKey: .kind)
        self.artworkURL = try container.decode(URL.self, forKey: .artworkURL)
        if let description = try? container.decode(String.self, forKey: CodingKeys.description) {
            self.description = description
        } else {
            let additionalValues = try decoder.container(keyedBy: AdditionalKeys.self)
            description = (try? additionalValues.decode(String.self, forKey: AdditionalKeys.longDescription)) ?? ""
            
        }
    }
}

struct SearchResponse: Codable {
    let results : [StoreItem]
}
