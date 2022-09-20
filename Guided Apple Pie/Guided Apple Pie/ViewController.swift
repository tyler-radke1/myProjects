//
//  ViewController.swift
//  Guided Apple Pie
//
//  Created by Tyler Radke on 9/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    var wordList = ["misspell", "pharaoh", "weird", "intelligence", "pronunciation", "handkerchief", "iogorrhea", "chiaroscurist", "gobbledegook", "conscientious"]
    
    let incorrectGuessesAllowed = 6
    
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
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
        let newWord = wordList.randomElement()
        
        for button in letterButtons {
            button.isEnabled = true
        }
    
    currentGame = Game(word: newWord!, incorrectMovesRemaining: incorrectGuessesAllowed, guessedLetters: [])
        updateUI()
        
    }
   
    func winCheck() {
        currentGame.formattedWordUpdate()
        
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
        } else if currentGame.formattedWord == currentGame.word {
            totalWins += 1
        } else {
            updateUI()
        }
        
        
    }
    
    func updateUI() {
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        currentGame.formattedWordUpdate()
        correctWord.text = currentGame.formattedWord
        
        
        treeImage.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }

   
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        sender.isEnabled = false
        let letterString = sender.configuration!.title!
        let letter = Character(letterString.lowercased())
        
        currentGame.guessedLetters.append(letter)
        
        if !currentGame.word.contains(letter) {
            currentGame.incorrectMovesRemaining-=1
        }
        
        winCheck()
        
    }
    
}

