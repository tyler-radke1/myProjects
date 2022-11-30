//
//  PhotoInfoController.swift
//  NASAPOTD
//
//  Created by Tyler Radke on 11/30/22.
//

import Foundation


class PhotoInfoController {
    enum PhotoInfoError: Error, LocalizedError {
        case itemNotFound
    }

    func fetchPhotoInfo() async throws -> PhotoInfo {
        var urlComponents = URLComponents(string:
           "https://api.nasa.gov/planetary/apod")!
        urlComponents.queryItems = [
            "api_key": "DEMO_KEY",
            "date" : "2000-08-10"
        ].map { URLQueryItem(name: $0.key, value: $0.value) }
        
        let (data, response) = try await URLSession.shared.data(from: urlComponents.url!)
        
        guard let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200 else {
            throw PhotoInfoError.itemNotFound
        }
        
        let jsonDecoder = JSONDecoder()
        let photoInfo = try jsonDecoder.decode(PhotoInfo.self, from: data)
        return(photoInfo)
    }

}
