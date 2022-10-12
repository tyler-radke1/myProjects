import UIKit

func findSum(num: Int) -> Int {
    guard num != 1 else { return 1 }
    return (1 + num) * (num / 2)
}

findSum(num: 8)
