import UIKit

func multTable(number: Int) -> String {
    var answer = ""
    for i in 1...10 {
        answer += "\n \(i) * \(number) = \(i * number)"
    }
    return answer
}

multTable(number: 976218)
