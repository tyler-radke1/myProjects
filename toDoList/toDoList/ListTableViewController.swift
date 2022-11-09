//
//  ListTableViewController.swift
//  toDoList
//
//  Created by Tyler Radke on 11/3/22.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    
    var tasks: [Task] = Task.loadSampleTasks()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        navigationItem.leftBarButtonItem = editButtonItem
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @IBAction func unwindToList(segue: UIStoryboardSegue) {
        guard segue.identifier == "unwindToList" else { return }
        let sourceViewController = segue.source as! AddTaskTableViewController
        
        if let taskToSend = sourceViewController.taskToPass {
            tasks.append(taskToSend)
            tableView.reloadData()
        }
        
        
    }
    

    @IBSegueAction func segueToAddTask(_ coder: NSCoder, sender: Any?) -> AddTaskTableViewController? {
        let addTaskTableViewController = AddTaskTableViewController(coder: coder)
        
        guard let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) else {
            return AddTaskTableViewController(coder: coder)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        addTaskTableViewController?.taskToPass =  tasks[indexPath.row]
        
        return addTaskTableViewController
        
        
    }
        
        
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskCell
        let task = tasks[indexPath.row]
        
        
        // Configure the cell...
        cell.taskTitleLabel.text = task.title
        cell.taskDoneSwitch.setOn((task.isCompleted), animated: false)
        cell.currentTask = task
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
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
