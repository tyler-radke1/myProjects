//
//  MenuItemCell.swift
//  orderingApp
//
//  Created by Tyler Radke on 12/20/22.
//

import UIKit

class MenuItemCell: UITableViewCell {

    
    @IBOutlet weak var itemImageView: UIImageView!
    
    @IBOutlet weak var itemPriceLabel: UILabel!
    @IBOutlet weak var itemNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
