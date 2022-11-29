import UIKit

func binToDec(binary: String) -> Int {

    var numArray = binary.reversed().map({ String($0) })
    
    for (i,v) in numArray.enumerated() {
        var doub = Double(String(v))
        var ind = Double(i)
        
        //Formula for Binary is 2^index * value, all added together
        var str = "\(pow(2, ind) * doub!)"
       
        numArray[i] = str
    }
    
    return numArray.reduce(0){ Int(Double($0)) + Int(Double($1)!) }
}

binToDec(binary: "1111")
