import UIKit

func century(year: Int) -> Int {
    guard year > 0 else {return 0}
    
    return (year % 100 == 0) ? year/100 : (year/100) + 1
}


century(year: 1705)
century(year: 1900)
century(year: 1601)
century(year: 2000)

century(year: 401)

century(year: -14)


