import UIKit


func ifContains(a: [Any?], x: Any?) -> Bool {
    
    if let input = a as? [String] {
        if let value = x as? String {
            if input.contains(value) {
            return true
            }
        }
    } else if let input = a as? [Int] {
        if let value = x as? Int {
            if input.contains(value) {
                return true
            }
        }
    }
    return false
}


ifContains(a: ["Monday", "Tuesday", "Wednesday"], x: "Tuesday")
ifContains(a: [1,2,3,4,5,6], x: 3)
ifContains(a: ["Halloween", "Christmas", "Easter"], x: "Fourth of July")
ifContains(a: [1,2,3,"4",5.0], x: 5.0)
