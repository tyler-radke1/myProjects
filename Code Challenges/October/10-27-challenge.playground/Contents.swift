import UIKit

func sums(numbers: [Int]?) -> [Int]? {
    guard let numbers = numbers, numbers != [] else {return nil}
    
    var solution: [Int] = [0,0]
    var x = 0
    
    for num in numbers {
        x = (num >= 1) ? 0 : 1
        solution[x] += (x == 0) ? 1 : num
        
        //same as above
//        if num >= 0 {
//            solution[0] += 1
//        } else if num <= -1 {
//            solution[1] += num
//        }
    }
    return solution
}


sums(numbers: [1,2,3,4,5,6,7,8,9,10,-11,-12,-13,-14,-15])
sums(numbers: [])
