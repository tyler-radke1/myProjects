import UIKit

let searchUrl = URL(string: "http://itunes.apple.com/search")!

let query = ["term" : "eminiem", "entity": "song", "limit" : "1"]

var components = URLComponents(url: searchUrl, resolvingAgainstBaseURL: true)!

components.queryItems = query.map({ URLQueryItem(name: $0.key, value: $0.value)})

Task {

    let response = try await URLSession.shared.data(from: components.url!)
    
    if let responseString = String(data: response.0, encoding: .utf8) {
        print(responseString)
    }
    
}

