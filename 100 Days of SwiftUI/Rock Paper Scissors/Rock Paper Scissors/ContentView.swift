//
//  ContentView.swift
//  Rock Paper Scissors
//
//  Created by Tyler Radke on 1/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var computerChoice: String?
    @State private var promptString: String = ""
    @State private var winOrLose = true
    @State private var score = 0
    // win is true, lose is false
    let weapons = ["Rock", "Paper", "Scissors"]
    
    func setChoice() {
        computerChoice = weapons.randomElement()
        winOrLose = Bool.random()
        promptString = winOrLose ? "You need to win" : "You need to lose"
    }
    
    
    func checkForWin(player: String, computer: String) -> Bool {
        
        //returns true if player wins, returns false if computer wins
        switch player {
        case "Rock":
            return (computer == "Scissors") ? true : false
        case "Paper":
            return (computer == "Rock") ? true : false
        case "Scissors":
            return (computer == "Paper") ? true : false
        default:
            return true
        }
    }
    
   
    
    
    var body: some View {
        
        
        VStack(spacing: 50) {
            Text("Your score is \(score)")
            Text("The computer selected \(computerChoice ?? "" )")
            Text(promptString)
            ForEach(0..<3) { number in
                Button(weapons[number]) {
                    if winOrLose {
                        score += (checkForWin(player: weapons[number], computer: computerChoice!) ? 1 : -1)
                    } else {
                        score += (!checkForWin(player: weapons[number], computer: computerChoice!) ? 1 : -1)
                    }
                    setChoice()
                }
            }

        } .onAppear() {
            setChoice()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
