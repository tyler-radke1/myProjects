import UIKit

func sinceMidnight(hour: Int, minute: Int, second: Int) -> Int {
    
    return (hour * 3600000) + (second * 1000) + (minute * 60000)
    
    
    
}


sinceMidnight(hour: 7, minute: 46, second: 0)
