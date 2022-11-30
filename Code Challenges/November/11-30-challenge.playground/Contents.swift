import UIKit
import Foundation



func nameSwap(name: String) -> String {
    
//    let solutionArray = name.split(separator: " ").reversed()
//
//    return solutionArray.joined(separator: " ")
    
    return name.split(separator: " ").reversed().joined(separator: " ")
}

nameSwap(name: "Ronald McDonald")
