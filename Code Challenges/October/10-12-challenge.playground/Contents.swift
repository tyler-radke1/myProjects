import UIKit

func phoneNumber(number: String) throws -> String {
    enum formatError: Error {
        case notAValidNumber
    }
    guard number.count == 10, Int(number) != nil else {throw formatError.notAValidNumber}
    let formattedNumber: NSMutableString = NSMutableString(string: number)
    
    for (index,_) in number.enumerated() {
        if (index == 3 || index == 7) {
            formattedNumber.insert("-", at: index)
        }
    }
    
    
    return String(formattedNumber)
}

try? phoneNumber(number: "8013177580")
try? phoneNumber(number: "8018675309")
try? phoneNumber(number: "18012838392123")
try? phoneNumber(number: "Hello")
