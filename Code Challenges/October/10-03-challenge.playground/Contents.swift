import UIKit

func twoSums(nums: [Int], target: Int) -> [Int] {
    var solution: [Int] = []
    
    
    for (index, value) in nums.enumerated() {
        
        for (ind, val) in nums.enumerated() {
            if (ind != index && val + value == target) {
                solution.append(index)
                solution.append(ind)
                return solution
            }
        }
        
        
        
    }
    
    return solution
    
    
}


twoSums(nums: [3,2,4], target: 6)
