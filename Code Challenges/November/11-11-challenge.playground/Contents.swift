import UIKit

func powersOfTwo(num: Int) -> [Int] {
    var solution: [Int] = []
    
    for number in 0...num {
        var numberToAdd = pow(Double(num), Double(number))
        solution.append(Int(numberToAdd))
    }
    
    return solution
}

powersOfTwo(num: 15)
