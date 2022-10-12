import UIKit

func divisible(array: [Int]) {
    
    for value in array {
        
        if value.isMultiple(of: 2) {
            print("\(value): Even")
        } else {
            print("\(value): Odd")
        }
    }
}
divisible(array: [4,8,9,3,6,2])
