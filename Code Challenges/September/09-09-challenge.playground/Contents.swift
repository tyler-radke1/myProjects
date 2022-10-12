import UIKit

func arrayElements(myArray: [Int], n: Int) -> [Int] {

    return Array(myArray[...n])
    
    
}

arrayElements(myArray: [1,2,3,4], n: 3)
