import UIKit

func stringsShare (arr1: [String], arr2: [String]) -> [String] {
    var solution: [String] = []
    
    for word in arr1 {
        if arr2.contains(word) {
            solution.append(word)
        }
    }
    
    return solution
    
}

func stringsDoNotShare (arr1: [String], arr2: [String]) -> [String] {
    var solution: [String] = []
    
    for word in arr1 {
        if !arr2.contains(word) {
            solution.append(word)
        }
    }
    
    for word in arr2 {
        if !arr1.contains(word) {
            solution.append(word)
        }
    }
    
    return solution
    
}

stringsShare(arr1: ["bird","lizard", "fish", "cat", "dog"], arr2: ["dog", "cat","bird"])

stringsDoNotShare(arr1: ["bird","lizard", "fish", "cat"], arr2: ["dog", "cat","bird"])
