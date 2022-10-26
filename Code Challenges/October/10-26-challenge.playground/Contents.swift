import UIKit


func factorial(number: Int) -> Int {
    
    return (number >= 0) ? 1 : number * factorial(number: (number-1))
    
    
}



factorial(number:-2)
