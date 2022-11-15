//
//  GameTableViewCell.swift
//  scoreKeeper
//
//  Created by Tyler Radke on 11/11/22.
//

import UIKit

class GameTableViewCell: UITableViewCell {

    @IBOutlet weak var gameTitleLabel: UILabel!
    
    @IBOutlet weak var currentWinnerLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
