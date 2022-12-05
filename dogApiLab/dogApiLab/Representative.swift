//
//  Representative.swift
//  dogApiLab
//
//  Created by Tyler Radke on 12/2/22.
//

import Foundation
import UIKit

struct stupidAPI: Codable {
    var results:[Representative]

    
}
    struct Representative: Codable {
        var name: String
        var party: String
        var district: String
        var state: String
      
        
        enum CodingKeys: String, CodingKey {
            case name, district, party, state
        }
        
        
        static func getRepData(zipCode: String) async throws -> [Representative] {
            let query = ["zip" : zipCode, "output" : "json"]
            
            let searchURL = URL(string: "https://whoismyrepresentative.com/getall_mems.php")!
            
            var components = URLComponents(url: searchURL, resolvingAgainstBaseURL: true)
            
            components?.queryItems = query.map( { URLQueryItem(name: $0.key, value: $0.value)})
            
          
            let response = try await URLSession.shared.data(from: (components?.url)!)
            
            let decoder = JSONDecoder()
            
            let data = try decoder.decode(stupidAPI.self, from: response.0)
            

            return data.results
        }
        
        
        
    }
    

    
    
    
    

