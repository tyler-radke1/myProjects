import UIKit
import Foundation


func reverseSort(_ strings: [String]) -> [String] {
    return strings.sorted(by: >)
}

reverseSort(["Bob", "Jill", "Sally"])
