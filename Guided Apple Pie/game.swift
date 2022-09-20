//
//  game.swift
//  Guided Apple Pie
//
//  Created by Tyler Radke on 9/13/22.
//

import Foundation

struct Game {
    var word: String
    var incorrectMovesRemaining: Int

    var guessedLetters: [Character]
    
    var formattedWord = ""
    
    mutating func playerGuessed(letter: Character) {
        guessedLetters.append(letter)
        
        if !word.contains(letter) {
            incorrectMovesRemaining -= 1
        }
    }
    
    mutating func formattedWordUpdate() {
        var guessedWord = ""
        
        for letter in word {
            if guessedLetters.contains(letter) {
                guessedWord += "\(letter)"
            } else {
                guessedWord += "_ "
              
            }
        }
        formattedWord = guessedWord
    }
    
}
