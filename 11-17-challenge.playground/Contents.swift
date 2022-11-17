import UIKit


func higherOrLower(a: Int, b: Int, c: Int? = 0) -> Int {
    guard let c = c else {
        return a - b == 0 ? 0 : (a > b) ? 1 : -1
        
    }
    return abs(a-b) <= c  ? 0 :  (a > b) ? 1 : -1
    
    //the above is the same as this
//    if abs(a-b) <= 0 {
//        return 0
//    } else {
//        return a>b ? 1 : -1
//    }
    
}


higherOrLower(a: -2, b: -2, c: nil)
