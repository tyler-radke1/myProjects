import UIKit

func removeSpaces(input: String) -> String {
    var solution = ""
    
    for letter in input {
        if letter != " " {
            solution += "\(letter)"
        }
    }
return solution
}

removeSpaces(input: "This function removes spaces")


