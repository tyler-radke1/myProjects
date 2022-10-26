import UIKit

extension String {
    func isPalindrome() -> Bool {
        var secondString = self.lowercased().reversed()
    
        return self.lowercased() == String(secondString)
    }
}




let check = "racecar"

check.isPalindrome()
