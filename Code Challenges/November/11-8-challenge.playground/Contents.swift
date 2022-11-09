import UIKit

func returnSum(array: [Int]) -> Int {
    
    return array.sorted().dropFirst().dropLast().reduce(0, +)
    
}

returnSum(array: [1,2,3])
returnSum(array: [1,1,11,2,3])
