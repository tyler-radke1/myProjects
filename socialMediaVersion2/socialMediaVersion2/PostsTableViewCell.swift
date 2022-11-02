//
//  PostTableViewCell.swift
//  socialMediaVersion2
//
//  Created by Tyler Radke on 11/1/22.
//

import UIKit

class PostsTableViewCell: UITableViewCell {

    @IBOutlet weak var postTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    
    func load(post: Post) {
        postTextView.text = post.content
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


}
