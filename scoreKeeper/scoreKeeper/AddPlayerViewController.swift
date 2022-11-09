//
//  AddPlayerViewController.swift
//  scoreKeeper
//
//  Created by Tyler Radke on 11/2/22.
//

import UIKit

protocol PlayerPassing {
    func passPlayer(player: Player)
}

class AddPlayerViewController: UIViewController {

    var delegate: PlayerPassing?
    @IBOutlet weak var addNameTextField: UITextField!
    
    @IBOutlet weak var addScoreTextField: UITextField!
    
    @IBOutlet weak var colorWell: UIColorWell!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        addNameTextField.layer.borderColor = UIColor.black.cgColor
        addNameTextField.layer.borderWidth = 1
        
        addScoreTextField.layer.borderColor = UIColor.black.cgColor
        addScoreTextField.layer.borderWidth = 1
    }

    @IBAction func addPlayerTapped(_ sender: Any) {
        let playerToSend = Player(name: addNameTextField.text ?? "New Player", score: Int(addScoreTextField.text ?? "0") ?? 0, profileColor: colorWell.selectedColor ?? .blue)
    
        delegate?.passPlayer(player: playerToSend)
        
        self.dismiss(animated: true)
        
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
