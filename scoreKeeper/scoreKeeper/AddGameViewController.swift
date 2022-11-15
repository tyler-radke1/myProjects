//
//  AddGameViewController.swift
//  scoreKeeper
//
//  Created by Tyler Radke on 11/14/22.
//

import UIKit

protocol AddNewGame {
    func addNewGame(game: Game)
}

class AddGameViewController: UIViewController {

    var addGameDelegate: AddNewGame?
    @IBOutlet weak var gameTitleTextField: UITextField!
    
    @IBOutlet weak var sortBySwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameTitleTextField.layer.borderColor = UIColor.black.cgColor
        gameTitleTextField.layer.borderWidth = 1

        // Do any additional setup after loading the view.
    }
    
    @IBAction func createGameTapped(_ sender: Any) {
        var gameToAdd = Game(gameTitle: gameTitleTextField.text ?? "New Game", sortBy: sortBySwitch.isOn, players: [])
        
        addGameDelegate?.addNewGame(game: gameToAdd)
        
        performSegue(withIdentifier: "fromGameToCreatePlayer", sender: nil)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
