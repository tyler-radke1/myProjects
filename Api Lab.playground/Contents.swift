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

struct SearchResponse: Codable {
    var results: [StoreItem]
}

enum ErrorTypes: Error, LocalizedError {
    case youDoneMessedUp
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
    
    let searchResponse = try decoder.decode(SearchResponse.self, from: response.0)
    
    
    return searchResponse.results
    
    
}

let query = [
    "term" : "jazz",
    "entity" : "album",
    "limit" : "5"
]


Task {
    do {
        let storeItems = try await fetchItems(query: query)
        storeItems.forEach { item in
            print("""
            Name: \(item.artistName)
            Genre: \(item.primaryGenreName)
            # of Tracks: \(item.trackCount)
             
             
            """)
        }
    } catch {
        print(error)
    }
}




