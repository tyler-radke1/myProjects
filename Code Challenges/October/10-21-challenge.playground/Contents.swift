import UIKit


func pluralStrings(arr: [String]) {
    
    var solution = " "
    
    for word in arr {
        solution += (word.lowercased().last == "s") ? "\(word) " : ""
    }
    
    print(solution)
}

pluralStrings(arr: ["Hello", "Ducks", "wonton", "couches"])
