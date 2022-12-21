import UIKit
import Foundation

func removeMark(str: String) -> String {
    var last: String = String(str.last!)
    var droppedLast = String(str.dropLast(1))
    
    return last == "!" ? droppedLast : str
    
    
}

removeMark(str: "hel!lo!")
