//
//  ViewController.swift
//  Guided Apple Pie
//
//  Created by Tyler Radke on 9/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    var wordList = ["misspell", "pharaoh", "weird", "intelligence", "pronunciation", "handkerchief", "iogorrhea", "chiaroscurist", "gobbledegook", "conscientoius"]
    
    let incorrectGuessesAllowed = 5
    
    var totalWins = 0
    var totalLosses = 0
    var currentGame: Game!
    
    @IBOutlet weak var treeImage: UIImageView!
    @IBOutlet weak var correctWord: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newRound()
    }
    
    
    
    func newRound() {
        let newWord = wordList.removeFirst()
        correctWord.text = newWord
        
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectGuessesAllowed, guessedLetters: [])
        
    }
   
    
    func updateUI() {
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        
        treeImage.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }

   
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        sender.isEnabled = false
        let letterString = sender.configuration!.title!
        let letter = Character(letterString.lowercased())
        print(currentGame.guessedLetters)
        
    }
    
    
    
}

