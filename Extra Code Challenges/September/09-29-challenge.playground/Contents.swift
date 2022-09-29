import UIKit

func gateway(input: Double) -> String {
   
    let numberFormatter = NumberFormatter()
    numberFormatter.minimumFractionDigits = 2
    
    return "$" + numberFormatter.string(from: input as NSNumber)!
}

gateway(input: 3.1)
gateway(input: 3)
gateway(input: 39.99)
