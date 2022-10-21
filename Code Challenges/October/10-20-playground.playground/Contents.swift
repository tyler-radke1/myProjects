import UIKit

func letterCount(string: String) -> [Character: Int] {
    var count: [Character: Int] = [:]
    let alphabet = "abcdefghijklmnopqrstuvwxyz"
    
    for letter in string.lowercased() {
        count[letter] = (count[letter] != nil && alphabet.contains(letter)) ? count[letter]! + 1 : 1
    }
    
    count.removeValue(forKey: " ")
    print(count)
    return count
}


letterCount(string: "aa bbb cccc")
