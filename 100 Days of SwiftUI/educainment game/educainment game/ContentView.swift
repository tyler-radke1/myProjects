//
//  ContentView.swift
//  educainment game
//
//  Created by Tyler Radke on 1/18/23.
//

import SwiftUI

struct ContentView: View {
    @State private var upTo = 1
    @State private var questionCount = 5
    @State private var questionOn = 0
    @State private var guess: Int? = nil
    @State private var questions: [Question] = []
    @State private var score = 0
    @State private var roundOn = 1
    
    
    var body: some View {
        VStack {
            
            Stepper("Tables up to \(upTo)", value: $upTo)
                .fixedSize()
            
            Text("How many questions would you like?")
            
            Picker("How many questions would you like?", selection: $questionCount) {
                Text("5").tag(5)
                Text("10").tag(10)
                Text("20").tag(20)
            }
            .pickerStyle(.segmented)
            
            Button(action: startGame) {
                Text("Go")
                    .padding()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
            }
            
            Spacer()
            
            if let currentQuestion = questions.last {
                
                Text("What is \(currentQuestion.firstNumber) X \(currentQuestion.secondNumber)")
                
                Text("Score: \(score)")
                
                
                List(currentQuestion.allAnswers, id: \.self) { answer in
                    Text(String(answer))
                        .onTapGesture {
                            
                            respondToAnswerTapped(answer: answer)
                        }
                    
                        .listRowBackground(guess == answer ? Color.green : Color.clear)
        
                    
                    
                    
                }
                
                
                
                
                
                
                
            }
            
            
            
            Spacer()
            
        }
        .onAppear() {
            
        }
        .padding()
    }
    
    func startGame() {
        generateQuestions(count: questionCount, max: upTo)
    }
    
    func generateQuestions(count: Int, max: Int) {
        for _ in 0...count {
            questions.append(Question(max: max))
        }
    }
    
    func respondToAnswerTapped(answer: Int)  {
        guard roundOn < questionCount else {
            return
        }
        
        if answer == questions.last?.correctAnswer {
            guess = answer
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                questions.removeLast()
                guess = nil
                score += 1
                roundOn += 1
            }
        } else {
           // guess = answer
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                questions.removeLast()
                guess = nil
                score -= 1
                roundOn -= 1
                
            }
        }
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Question {
    var firstNumber: Int
    var secondNumber: Int
    //    var max: Int
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
        incorrectAnswers = Question.getArray(max: max)

    }
    
    
    
    static func getArray(max: Int) -> [Int] {
        let firstWrong = Int.random(in: 1...max) * Int.random(in: 1...max)
        let secondWrong = Int.random(in: 1...max) * Int.random(in: 1...max)
        let thirdWrong = Int.random(in: 1...max) * Int.random(in: 1...max)
        
        var array = [firstWrong, secondWrong, thirdWrong]
        
        while (!isUnique(array) && max >= 2) {
            
            array.removeFirst()
            
            array.append(Int.random(in: 1...max))
            
        }

        return array
        
        //return [firstWrong, secondWrong, thirdWrong]
    }

    static func getNewNumbers(max: Int) -> [Int] {
        let firstWrong = Int.random(in: 1...max) * Int.random(in: 1...max)
        let secondWrong = Int.random(in: 1...max) * Int.random(in: 1...max)
        let thirdWrong = Int.random(in: 1...max) * Int.random(in: 1...max)
        
        return [firstWrong, secondWrong, thirdWrong]
    }

  static  func isUnique(_ arr: [Int]) -> Bool {
        var copy = arr
        
        
        for number in copy {
            copy.removeFirst()
            if copy.contains(number) {
                return false
            }
        }
        
      return true
    }
    
    
}




