import UIKit



func scoreAverage(scores: [Int]) -> Int? {
    guard scores.count != 0 else {return nil}
    
    return scores.reduce(0,+) / scores.count

}

scoreAverage(scores: [98,97,82,66,88])
