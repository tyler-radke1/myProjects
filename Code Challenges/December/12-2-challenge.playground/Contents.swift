import UIKit
//extension Int {
//    func isEven() {
//        return (self % 2 == 0)
//    }
//
    
    




func decending(nums: [Int]) -> Int {
    var total = 0
    for (ind, num) in nums.sorted(by: >).enumerated() {
        guard ind < nums.count - 1 else { return total}
        total += (num - nums.sorted(by: >)[ind + 1])
    }
     return total

}

decending(nums: [2,1,10])
