import UIKit

func evenReturn(number: Int) -> Int {
    guard (number > 0) else {return -1}
    
   return (number * 2) - 2
}


evenReturn(number: 14)
