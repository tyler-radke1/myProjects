//
//  TaskCell.swift
//  toDoList
//
//  Created by Tyler Radke on 11/3/22.
//

import UIKit
protocol TaskCellDelegate {
    func checkMarkTapped(sender: TaskCell)
}
class TaskCell: UITableViewCell {

    @IBOutlet weak var taskTitleLabel: UILabel!
    
    var delegate: TaskCellDelegate?
    
    @IBOutlet weak var isDoneButton: UIButton!
    
    var isDoneBool = false
    
    
    var currentTask: Task?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        isDoneButton.setImage(UIImage(systemName: "checkmark.circle"), for: .selected)
        isDoneButton.setImage(UIImage(systemName: "circle"), for: .normal)
      
        
//
//
        // Initialization code
    }
    
//    func updateButton() {
//        if currentTask?.isCompleted == true {
//            isDoneButton.imageView?.image = UIImage(systemName: "checkmark.circle.fill")
//        } else {
//            isDoneButton.imageView?.image = UIImage(systemName: "circle")
//        }
//
//    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func isDoneButtonTapped(_ sender: UIButton) {
       
        //updateButton()
        
        isDoneButton.isSelected.toggle()
        delegate?.checkMarkTapped(sender: self)
        
      
        
    }
    

}
