//
//  StoreItemController.swift
//  iTunesSearch
//
//  Created by Tyler Radke on 12/1/22.
//

import Foundation
import UIKit

class StoreItemController {
    enum ErrorTypes: Error, LocalizedError {
        case youDoneMessedUp
    }
    
    func fetchImage(item: StoreItem) async throws -> Data {
        
        let data = try await URLSession.shared.data(from: item.artworkURL)
        
        
        return data.0
//        let decoder = JSONDecoder()
//
//        return try decoder.decode(Data.self, from: data.0)
        
        
    }
    
    func fetchItems(query: [String: String]) async throws -> [StoreItem] {
        
        let searchUrl = URL(string: "http://itunes.apple.com/search")!
        
        var components = URLComponents(url: searchUrl, resolvingAgainstBaseURL: true)!
        
        components.queryItems = query.map({ URLQueryItem(name: $0.key, value: $0.value)})
        
        let response = try await URLSession.shared.data(from: components.url!)
        
        if let httpResponse = response.1 as? HTTPURLResponse, httpResponse.statusCode == 200 {
            response.0.prettyPrintedJSONString()
        } else {
            throw ErrorTypes.youDoneMessedUp
        }
        
        let decoder = JSONDecoder()
        
        //  return try decoder.decode([StoreItem].self, from: response.0)
        
        let searchResponse = try decoder.decode(SearchResponse.self, from: response.0)
        
        
        return searchResponse.results
        
    }
    
}
