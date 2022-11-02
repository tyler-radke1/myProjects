import UIKit

func betterOrWorse(scores: [Int], myScore: Int) -> Bool {
    
    print("Average is \((scores.reduce(0, +) / scores.count))")
    
    return myScore > (scores.reduce(0, +) / scores.count)
}


betterOrWorse(scores: [76,56,78,76], myScore:72)
