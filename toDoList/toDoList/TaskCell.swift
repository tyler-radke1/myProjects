//
//  TaskCell.swift
//  toDoList
//
//  Created by Tyler Radke on 11/3/22.
//

import UIKit

class TaskCell: UITableViewCell {

    @IBOutlet weak var taskTitleLabel: UILabel!
    

    
    @IBOutlet weak var taskDoneSwitch: UISwitch!
    
    var currentTask: Task?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
