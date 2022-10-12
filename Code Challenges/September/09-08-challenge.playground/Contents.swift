import UIKit



func cubeDifference(_ list1: [Int], _ list2: [Int]) -> Int? {
    let a = list1.reduce(1,*)
    let b = list2.reduce(1,*)
    
    guard list1.count == 3 && list2.count == 3 && a != 0 && b != 0 else {
        return nil
    }
    return abs(a-b)

}

cubeDifference([2,3,4], [2,4,1])
