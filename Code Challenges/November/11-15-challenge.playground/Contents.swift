import UIKit


func rockPaperScissors(playerOne: String) -> String {
    
    let winningConditions = ["rock": "scissors", "paper": "rock", "scissors": "paper"]
    var playerTwo = Array(winningConditions.keys)[Int.random(in: 0...2)]
    
    print("Human: \(playerOne) \nComputer: \(playerTwo)")
    guard winningConditions[playerOne.lowercased()] != nil, winningConditions[playerTwo.lowercased()] != nil else {
        return "invalid output"
    }
    
    if winningConditions[playerOne.lowercased()] == playerTwo.lowercased() {
        print("Human wins!\n")
        return "Human wins!"
    }
    
    if winningConditions[playerTwo.lowercased()] == playerOne.lowercased() {
        print("Computer wins!\n")
        return "Computer wins!"
    }
    
    print("It's a draw\n")
    return "It's a draw!"

}

rockPaperScissors(playerOne: "paper")


for _ in 1...10 {
    var random = ["rock", "paper", "scissors"]
    
    rockPaperScissors(playerOne: random[Int.random(in: 0...2)] )
}
