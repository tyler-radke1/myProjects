import UIKit

//func selectionSort(array: [Int]) -> [Int] {
//
//    var nums = array
//
//    for i in 0...array.count - 1 {
//        var smallestNum = nums[i]
//        for j in 0...array.count - 1 {
//
//
//            if nums[j] < smallestNum {
//                smallestNum = nums[j]
//            }
//        }
//
//    }
//    return array
//}
//
//selectionSort(array: [11,1,3,4,2,10])

func selectionSort(nums: [Int]) -> [Int] {
    var myNums = nums
    
    for i in 0..<myNums.count {
        var smallestNum = myNums[i]
        var index = i
        for j in 0..<myNums.count {
            
            // We do not want to iterate over the already sorted part of the array
            
            if j < i {
                continue
            }
            
            // See if there is a smaller number than what we have stored in smallestNumber
            
            if smallestNum > myNums[j] {
                smallestNum = myNums[j]
                index = j
            }
            
            // Done searching for the smallest number
            
            if(j+1 == myNums.count) {
                // i is our pointer at the end of the sorted part of the array
                // index is the index of the smallest number in the unsorted part of the array
                
                myNums.insert(smallestNum, at: i)
                myNums.remove(at: index + 1)
            }
        }
    }
    
    return myNums
}

