import UIKit

func isPrime(num : Int) -> Bool {
    guard num > 2 else { return true }
    
    for v in 2...num {
        return num % v != 0
//        if num % v == 0 {
//            return false
//        } else {
//            return true
//        }
    }
    return true
}


func wilsonPrime(number: Int) -> Bool {
    guard (isPrime(num: number)) else {
        return false
    }
    
    //finds factorial of n - 1
    var factorial = 1
    if (number > 0) {
        for i in 1...(number-1) {
            factorial *= i
        }
    }
    
    let numberToTest = ((factorial) + 1) / (number * number)
    return  Double(numberToTest).truncatingRemainder(dividingBy: 1.0) == 0
}

wilsonPrime(number: 13)


func wilsonPrimeEasyMode(number: Int) -> Bool {
    guard (number == 5 || number == 13 || number == 563) else {
        return false
    }
    return true
}

wilsonPrimeEasyMode(number: 563)

