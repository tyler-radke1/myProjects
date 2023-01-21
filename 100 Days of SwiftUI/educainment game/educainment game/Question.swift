//
//  Question.swift
//  educainment game
//
//  Created by Tyler Radke on 1/20/23.
//

import Foundation

struct Question {
    var firstNumber: Int
    var secondNumber: Int
   
    let incorrectAnswers: [Int]
    
    var correctAnswer: Int {
        firstNumber * secondNumber
    }
    
    var allAnswers: [Int] {
        (incorrectAnswers + [correctAnswer]).sorted()
    }
    
    init(max: Int) {
        firstNumber = Int.random(in: 1...max)
        secondNumber = Int.random(in: 1...max)
        incorrectAnswers = Question.getArray(max: max, correctAnswer: (firstNumber * secondNumber))

    }
    
    static func getArray(max: Int, correctAnswer: Int) -> [Int] {
        let firstWrong = Int.random(in: 1...max) * Int.random(in: 1...max)
        let secondWrong = Int.random(in: 1...max) * Int.random(in: 1...max)
        let thirdWrong = Int.random(in: 1...max) * Int.random(in: 1...max)

        var array = [firstWrong, secondWrong, thirdWrong]

        while (!array.isUnique(correctAnswer) && max >= 2) {

            array.removeFirst()

            array.append(Int.random(in: 1...max))

        }

        
        return array
        
        
    }
}



extension [Int] {
    
    func isUnique(_ answer: Int) -> Bool {
        guard !self.contains(answer) else {return false}
        
        var copy = self
        
        for number in copy {
            copy.removeFirst()
            if copy.contains(number) {
                return false
            }
        }
        
      return true
    }
    
    
    
}

