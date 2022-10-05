import UIKit

func insertSort(arr: [Int]) -> [Int] {
    var times = 0
    var solution = arr
    
    
    while times != arr.count {
        for num in 0..<arr.count-1 {
            if arr[num] > arr[num+1] {
                solution.swapAt(num, num+1)
            }
            times+=1
        }
        
    }
    
    return solution
    
}

insertSort(arr: [5,2,14,1,3])
