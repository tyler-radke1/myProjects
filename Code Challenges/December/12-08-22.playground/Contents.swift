import UIKit

extension Character {
    func caseMatch(b: Character) -> Int {
        guard self.isLetter && b.isLetter else { return -1 }
 
        switch self.isLowercase {
        case true:
            return (b.isLowercase) ? 1 : 0
        case false:
            return (b.isLowercase) ? 0 : 1
        }

        
    }
}
let test0: Character = "a"
let test1: Character = "A"
let test2: Character = "b"
let test3: Character = "B"
let test4: Character = "0"
test0.caseMatch(b: "g")
test1.caseMatch(b: "C")
test2.caseMatch(b: "G")
test3.caseMatch(b: "g")
test4.caseMatch(b: "g")
