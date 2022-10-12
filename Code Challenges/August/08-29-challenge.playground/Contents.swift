import UIKit

func array (array: [Int]) -> [Int] {
    var numbers = [Int]()
    
    for number in array {
        let newNumber = number * 5
        numbers.append(newNumber)
    }

    return numbers
}

array(array: [5,6,4,3])


