import UIKit

func isPrime(num : Int) -> Bool {
    guard num > 2 else { return true }
    
    for v in 2...num {
        return num % v != 0
//        if num % v == 0 {
//            return false
//        } else {
//            return true
//        }
    }
    return true
}

isPrime(num: 18)
