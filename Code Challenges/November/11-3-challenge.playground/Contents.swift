import UIKit

func multiples(value: Int, lim: Int) -> [Int] {
    var solution: [Int] = []
    
    for number in 1...lim {
        if number % value == 0 {
            solution.append(number)
        }
    }
    return solution

}

multiples(value: 5, lim: 100)
