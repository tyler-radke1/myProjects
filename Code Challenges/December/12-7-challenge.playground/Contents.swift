import UIKit

func dogYears(humanYears: Int) -> [Int]{
    guard humanYears > 1 else {return [1, 15, 15]}
    
    var catYears = ((humanYears - 2) * 4) + 24
    var dogYears = (catYears + humanYears - 2)
    
    return [humanYears, catYears, dogYears]
    
}

dogYears(humanYears: 8)
