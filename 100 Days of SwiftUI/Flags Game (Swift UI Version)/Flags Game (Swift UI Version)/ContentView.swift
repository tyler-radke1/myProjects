//
//  ContentView.swift
//  Flags Game (Swift UI Version)
//
//  Created by Tyler Radke on 1/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var notScore = 0
    
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State var correctAnswer = Int.random(in: 0...2)
    var body: some View {
        
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
            
            
            VStack(spacing: 15) {
                Text("Guessed Correctly: \(score) : Guessed incorrectly : \(notScore)")
                    
                Text("Choose The correct flag for")
                    .font(.title)
                    .foregroundColor(.secondary)
                Text("\(countries[correctAnswer])")
                    .font(.subheadline)
                
                VStack {
                    ForEach(0..<3) { number in
                        Button {
                            score += (number == correctAnswer) ? 1 : 0
                            notScore += (number != correctAnswer) ? 1 : 0
                            flagTapped(number)
                           
                            
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original)
                        }
                        .border(.white, width: 1)
                        .shadow(radius: 5)
                        
                        .clipShape(Capsule())
                    }
                }
               
                
                
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .background(.regularMaterial)
            .foregroundColor(.white)
         
        }
        
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: resetFlags)
        } message: {
           // Text("Your score is \(score)")
        }
   
    }
    
    func flagTapped(_ number: Int) {
        scoreTitle = (number == correctAnswer) ? "Correct!" : "Wrong."
        showingScore = true
        
    }
    
    func resetFlags() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
