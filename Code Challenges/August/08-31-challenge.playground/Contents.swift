import UIKit

func squared(arr: [Int]) -> Int {
    
    var total = 0
    for number in arr {
        total += (number * number)
    }
   return total
    
}

squared(arr: [4,5])
