import UIKit


func returnArray(a: Int, b: Int) -> [Int] {
    guard a < b else { return [0]}
    
    return Array(a...b)
    
}

returnArray(a: 10, b: 20)
returnArray(a: 1, b: 15)

func blackDiamondArray(a: Int, b: Int) -> [Int] {
    guard a < b else { return [0] }
    let range = a...b
   
    return range.filter { $0 % a == 0}
}

blackDiamondArray(a: 6, b: 100)
