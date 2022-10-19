import UIKit

func wordCount(str : String) -> [String: Int] {
    var copy = str
    copy.append(" ")
    
    var words: [String: Int] = [:]
    var check = ""
    
    for letter in copy.lowercased() {
        if letter != " " {
            check += "\(letter)"
        } else {
            if let _ = words[check] {
                words[check]! += 1
            } else {
                words[check] = 1
            }
            check = ""
        }
    }

return words
}


wordCount(str: "the quick brown fox")

