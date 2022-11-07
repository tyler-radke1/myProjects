import UIKit

func alphabetLocation(letter: String) -> Int {
    var alphabet = "abcdefghijklmnopqrstuvwxyz"
    var letter = letter.lowercased()
    guard alphabet.contains(letter), letter.count == 1 else {return 0}
    
    for (ind, char) in alphabet.enumerated() {
        if String(char) == letter {
            return ind + 1
        }
    }
    
    return 1
}

alphabetLocation(letter: "Dd")
