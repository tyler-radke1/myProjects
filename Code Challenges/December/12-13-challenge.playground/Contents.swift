import UIKit
import Foundation

extension Double {
    func days() -> Double {
        return self * 86400
    }
    
    
}


func dateBool(date: Date) -> Bool {
    
    return Calendar.current.isDateInToday(date)
    
}


let day = Date().advanced(by: 12.days())

dateBool(date: day)
