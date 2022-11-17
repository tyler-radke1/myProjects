import UIKit
import Foundation


func isDigit(int: String) -> Bool {
  //works
    guard let int = Int(int) else {return false}
     return int >= 0 && int <= 9
    
    
//does not work but I tried
//    let pattern = try? Regex(".(0123456789)")
//    return (pattern.firstMatch(in: int) != nil)

  
}

isDigit(int: "-1")


