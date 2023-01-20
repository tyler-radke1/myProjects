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





