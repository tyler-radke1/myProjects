//
//  GoodBoi.swift
//  dogApiLab
//
//  Created by Tyler Radke on 12/2/22.
//

import Foundation
class DogClass {
    
    struct Dog: Codable {
        var picUrl: String
        var status: String
        
        
        enum CodingKeys: String, CodingKey {
            case picUrl = "message"
            case status
            
            
        }
    }
    
    
    func dogRequest() async throws -> Dog {
        let url = URL(string: "https://dog.ceo/api/breeds/image/random")
        
        do {
            let dogRequest = try await URLSession.shared.data(from: url!)
            
            let decoder = JSONDecoder()
            
            let dogResponse = try decoder.decode(Dog.self, from: dogRequest.0)
            
            return dogResponse
            
        } catch {
            throw error
        }
        
    }
    
    
    
    func fetchImage(dog: Dog) async throws -> Data? {
        guard let url = URL(string: dog.picUrl) else { return nil }
        
        
        let data = try await URLSession.shared.data(from: url)
        
        return data.0
    }
    
}
