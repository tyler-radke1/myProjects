//
//  ItemCollectionViewCell.swift
//  iTunesSearch
//
//  Created by Tyler Radke on 1/29/23.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell, ItemDisplaying {
    
    @IBOutlet weak var itemImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var detailLabel: UILabel!
    
}
