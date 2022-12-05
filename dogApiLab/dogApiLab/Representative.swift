//
//  Representative.swift
//  dogApiLab
//
//  Created by Tyler Radke on 12/2/22.
//

import Foundation
import UIKit

struct stupidAPI: Codable {
    var results: [String : [String: String]]

    
}
    struct Representative: Codable {
        var name: String
        var state: String
        var district: String
        var website: String
        
        enum CodingKeys: String, CodingKey {
            case name, state, district, website
        }
        
        
        static func getRepData(zipCode: Int) async throws -> [Representative] {
            let query = ["zip" : "\(zipCode)", "output" : "json"]
            
            let searchURL = URL(string: "https://whoismyrepresentative.com/getall_mems.php")!
            
            var components = URLComponents(url: searchURL, resolvingAgainstBaseURL: true)
            
            components?.queryItems = query.map( { URLQueryItem(name: $0.key, value: $0.value)})
            
          
            let response = try await URLSession.shared.data(from: (components?.url)!)
            
            let decoder = JSONDecoder()
            
            let data = try decoder.decode(stupidAPI.self, from: response.0)
            
            print(data.results.keys)
            
            return data.results.keys as! [Representative]
        }
        
        
        
    }
    

    
    
    
    

