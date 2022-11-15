import UIKit


func rockPaperScissors(playerOne: String, playerTwo: String) -> String {
    let winningConditions = ["rock": "scissors", "paper": "rock", "scissors": "paper"]
    
    guard winningConditions[playerOne.lowercased()] != nil, winningConditions[playerTwo.lowercased()] != nil else {
        return "invalid output"
    }
    
    if winningConditions[playerOne.lowercased()] == playerTwo.lowercased() {
        return "Player one wins!"
    }
    
    if winningConditions[playerTwo.lowercased()] == playerOne.lowercased() {
        return "Player two wins!"
    }

    return "It's a draw!"

}

rockPaperScissors(playerOne: "rock", playerTwo: "scissors")
