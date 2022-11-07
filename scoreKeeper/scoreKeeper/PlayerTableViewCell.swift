//
//  PlayerTableViewCell.swift
//  scoreKeeper
//
//  Created by Tyler Radke on 11/2/22.
//

import UIKit
protocol PlayerTableViewCellDelegate: AnyObject {
    func updateTableView(stepper: Double, row: Int, playerToUpdate: Player)
}

class PlayerTableViewCell: UITableViewCell {
    
    
    weak var delegate: PlayerTableViewCellDelegate?
    
    var playerBeingEdited: Player?
    
    var row: Int?

    @IBOutlet weak var playerImageView: UIImageView!
    //Picture to be implemented later
    
    @IBOutlet weak var playerNameLabel: UILabel!
    
    @IBOutlet weak var playerStepper: UIStepper!
    
    @IBOutlet weak var playerScoreCounter: UILabel!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
       // let layer = CALayer()
        
        self.layer.borderColor = UIColor.black.cgColor
        
        self.layer.borderWidth = 1
        
        
            
      
        // Initialization code
    }
    
   
    
   
    @IBAction func stepperTapped(_ sender: Any) {
        guard let playerBeingEdited = playerBeingEdited else { return }
       
        delegate?.updateTableView(stepper: playerStepper.value, row: self.row!, playerToUpdate: playerBeingEdited)
        
        playerScoreCounter.text = "\(playerBeingEdited.score)"
        
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
