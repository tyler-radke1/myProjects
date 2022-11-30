import UIKit

extension Data {
    func prettyPrintedJSONString() {
        guard
            let jsonObject = try?
                JSONSerialization.jsonObject(with: self,
                                             options: []),
            let jsonData = try?
                JSONSerialization.data(withJSONObject:
                                        jsonObject, options: [.prettyPrinted]),
            let prettyJSONString = String(data: jsonData,
                                          encoding: .utf8) else {
            print("Failed to read JSON Object.")
            return
        }
        print(prettyJSONString)
    }
    
}




struct StoreItem: Codable {
    var artistName: String
    var primaryGenreName: String
    var trackCount: String
    
    
    enum CodingKeys: String, CodingKey {
        case artistName = "artist_name"
        case primaryGenreName = "primary_genre_name"
        case trackCount = "track_count"
    }
}

struct SearchRespone: Codable {
    var results: [StoreItem]
}


func fetchItems(query: [String: String]) async throws -> [StoreItem] {
    
    let searchUrl = URL(string: "http://itunes.apple.com/search")!
    
    var components = URLComponents(url: searchUrl, resolvingAgainstBaseURL: true)!
    
    components.queryItems = query.map({ URLQueryItem(name: $0.key, value: $0.value)})
    
    let response = try await URLSession.shared.data(from: components.url!)
    
    if let httpResponse = response.1 as? HTTPURLResponse, httpResponse.statusCode == 200 {
        response.0.prettyPrintedJSONString()
    }

    
    
    
    
}






