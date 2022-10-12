import UIKit

func sumArray(_ array: [Int]) -> Int{
    var sum = 0
    
    for value in array {
        sum+=(value >= 0 ? value : 0)
    }
    return sum
}


sumArray([1,-4,7,12])
