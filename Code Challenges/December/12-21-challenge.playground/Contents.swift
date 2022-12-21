import UIKit
import Foundation

func asciiParty(arr: [Int]) -> [Character: [Int]] {
    
    var solution: [Character: [Int]] = ["a": [], "e" : [], "i" : [], "o": [], "u" : []]
    var ascii = [97,101,105,111,117]
    
    
     for (index, number) in arr.enumerated() {
        if ascii.contains(number) {
            var key = Character(UnicodeScalar(number)!)
            
            solution[key]?.append(index)
        }
        
    }
    
    print(solution)
    return solution
    
    
}

asciiParty(arr: [1,14,90,111,111,111,117])
