import UIKit
import Darwin

func areaOfTriangle(a: Double, b: Double, c: Double) -> Double {
    let s = (a + b + c) / 2
    let areaFormatter = NumberFormatter()
    areaFormatter.maximumFractionDigits = 2
    
    if let answer = areaFormatter.string(from: sqrtl(s * (s - a) * (s - b) * (s - c)) as NSNumber) {
        
        if let solution = Double(answer) {
            return solution
        }
        
    }
    return 0.0
}

areaOfTriangle(a: 12, b: 14, c: 20.34354)
