import UIKit

let color = "green"
let number = 50
let letter = "y"

if color == "blue" {
    print("That is my favorite color!")
} else {
    print("Cool ... I guess")
}

if number >= 0 && number <= 100 {
    print("That is a valid number")
} else {
    print("That is not a valid number")
}

switch letter {
case "a", "e", "i", "o", "u":
    print("letter is a vowel")
case "y":
    print("letter is sometimes a vowel")
    
default:
    print("letter is a consonant")
}
