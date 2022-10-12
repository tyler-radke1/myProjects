import UIKit

func consecutive(arr: [Int]) -> Int? {
    
    for (index,number) in arr.enumerated() {
        if index != 0 {
            if arr[(index-1)] == (number-1) {
                continue
            } else {
                return number
            }
        }
        
    }
    return nil
}

consecutive(arr: [1,8])
