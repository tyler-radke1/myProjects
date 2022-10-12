import UIKit

func stringOfSize(size: Int) -> String{
    var string = ""
    var numberToAdd = true
    
    for _ in 1...size {
        if numberToAdd == false {
            string+="0"
            numberToAdd.toggle()
        } else if numberToAdd == true{
            string+="1"
            numberToAdd.toggle()
        }
    }
   
    return string
}


stringOfSize(size: 6)
