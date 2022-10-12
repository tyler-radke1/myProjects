import UIKit



func getGrade(_ grade1: Int,_ grade2: Int,_ grade3: Int) -> String {

    switch ((grade1 + grade2 + grade3) / 3) {
    case 0...59:
        return "F"
    case 60...69:
        return "D"
    case 70...79:
        return "C"
    case 80...89:
        return "B"
    case 90...100:
        return "A"
    default:
        return "Abc"
    }
}

getGrade(80,75,80)
