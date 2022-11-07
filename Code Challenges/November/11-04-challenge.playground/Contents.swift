import UIKit
import Foundation

func nthPower(numbers: [Int], n: Int) -> Int? {
    guard n <= numbers.count - 1, n > 0 else { return nil }
    
    var numberToMultiply = Double(numbers[n])
    var power = Double(n)
    
    return Int(pow(numberToMultiply,power))
    
}

nthPower(numbers: [4,5,1,3,6], n: 4)
