//
//  SearchApi.swift
//  LifeForm-Search
//
//  Created by Tyler Radke on 1/20/23.
//

import Foundation

struct Animal: Codable {
    
    var id : Int
    
    var scientificName : String
    
    var commonName : String
    
    var link: String
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case scientificName = "title"
        case commonName = "content"
        case link
    }
}





struct SearchRequest: APIRequest {
    var search: String
    
    var urlRequest: URLRequest {
        
        
        let url = URL(string: "https://eol.org/api/search/1.0.json")
        var components = URLComponents(url: url!, resolvingAgainstBaseURL: true)!
        
        components.queryItems = [URLQueryItem(name: "q", value: search), URLQueryItem(name: "page", value: "1")]
        
        
        return URLRequest(url: components.url!)
    }
    
    func decodeResponse(data: Data) throws -> Animals {
        //  print(data.prettyPrintedJsonString())
        
        if let animals = try? JSONDecoder().decode(Animals.self, from: data) {
            
            
            return animals
        } else {
            print("couldn't decode data")
            throw APIRequestError.itemNotFound
        }
        
    }
}
struct Animals: Codable {
    var results: [Animal]
}
