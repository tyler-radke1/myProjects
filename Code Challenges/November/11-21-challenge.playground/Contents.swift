import UIKit
import Foundation
func sumOfStringNums(string: String) -> Int{

  
    var array = string.components(separatedBy: CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyz"))
    
    array.removeAll(where: { Int($0) == nil })
    
    var secondArray = array.map( { Int($0)! })
    
    return secondArray.reduce(0, +)
   
    
}

sumOfStringNums(string: "The30quick20brown10f0x1203jumps914ov3r1349the102l4zy og")
