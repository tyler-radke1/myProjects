import UIKit
import Foundation

func multiplesSum(n: Int, m: Int) -> Int? {
    guard n >= 0, m >= 0 else { return nil}
    
    //      map creates an array from 1 to m, filter pulls out all numbers not divisible by n, reduce adds them all together
    return (1...m).map({ $0 }).filter({ $0 % n == 0 }).reduce(0, +)
    
}

multiplesSum(n: 2, m: 9)
multiplesSum(n: 3, m: 13)
multiplesSum(n: 97, m: 997)
multiplesSum(n: 3, m: -13)
multiplesSum(n: 13, m: 427)
