import UIKit

// what I tried (Does not work)
func square(array: [Int]) -> [Int] {
    var newArray = [Int]()
    
    for number in array {
        if (sqrt(Double(number))).truncatingRemainder(dividingBy: 1) == 0 {
            newArray.append(Int(sqrt(Double(number))))
        } else {
            newArray.append(Int(pow(Double(number), 2)))
        }
    }
    
    return newArray
}

square(array:[4,3,9,7,2,1])

