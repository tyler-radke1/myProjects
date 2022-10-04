import UIKit

func bubbleSort(arr: [Int]) -> [Int] {
    var sol = arr
    var val1: Int
    var val2: Int
    var rep = 0
    
    while rep != sol.count-1 {
        
        for v in 0..<(sol.count-1) {
            val2 = sol[v+1]
            val1 = sol[v]
            
            sol[v] = val1 > val2 ? val2 : val1
            sol[v+1] = val2 < val1 ? val1 : val2
        }
        rep += rep != sol.count - 1 ? 1 : 0
    }
    return sol
}
bubbleSort(arr: [5,10,1,3,17,2])



