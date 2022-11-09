//
//  AddTaskTableViewController.swift
//  toDoList
//
//  Created by Tyler Radke on 11/7/22.
//

protocol DatePassingProtocol {
    func protocolFuction(TaskToPass: Task)
    
}

import UIKit

class AddTaskTableViewController: UITableViewController {

    
    
    var delegate: DatePassingProtocol?
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var isCompleteButton: UIButton!
    
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    @IBOutlet weak var dueDateLabel: UILabel!
    
    @IBOutlet weak var notesTextView: UITextView!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateSaveButton()
        isCompleteButton.setImage(UIImage(systemName: "circle"), for: .normal)
        isCompleteButton.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .selected)
        
        
        
        dueDatePicker.date = Date().addingTimeInterval(24*60*60)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    func updateSaveButton() {
        if let saveValue = titleTextField.text?.isEmpty {
            saveButton.isEnabled = !saveValue
        }
    
    }
    
    func updateDateLabel(date: Date) {
        
        dueDateLabel.text = date.formatted(date: .abbreviated, time: .omitted)

         
    }
    

 
    @IBAction func titleTextFieldChanged(_ sender: UITextField) {
        updateSaveButton()
    }
    
    @IBAction func returnPressed(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func isCompleteButtonTapped(_ sender: UIButton) {
        print(isCompleteButton.isFocused)
        isCompleteButton.isSelected.toggle()
       
        
       
        
        
    }
    
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        delegate?.protocolFuction(taskToPass: Task(id: UUID(), title: titleTextField.text?, isCompleted: isCompleteButton.isSelected))
        
    }
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        updateDateLabel(date: sender.date)
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
