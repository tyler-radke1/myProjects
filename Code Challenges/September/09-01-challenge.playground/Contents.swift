import UIKit


func replace(digits: String) -> String {
    var replaced = ""
    
    for char in digits {
        if let num = char.wholeNumberValue {
            if num < 5 {
                replaced += "0"
            } else if num >= 5 {
                replaced += "1"
            }
        }
        
        
    }
    
    return replaced
}


replace(digits:"9596")
