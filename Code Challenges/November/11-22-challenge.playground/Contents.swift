import UIKit

var array = [[5,6,3], [3,6,8], [98,2,5]]


func estimate(stairs: [[Int]]) -> Int {
//    var dayTotal: [Int] = []
//    for day in stairs {
//        dayTotal.append(day.reduce(0, +))
//    }
//
//    return dayTotal.reduce(0, +) * 20
//
    //This is a better way to do the same thing.
   return stairs.map { $0.reduce(0, +)}.reduce(0, +) * 20
    
}

estimate(stairs: array)
