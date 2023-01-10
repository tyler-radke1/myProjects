//
//  ListTableViewController.swift
//  toDoList
//
//  Created by Tyler Radke on 11/3/22.
//

import UIKit

class ListTableViewController: UITableViewController, TaskCellDelegate {
  
    
    
    
    var tasks: [Task] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tasks = Task.loadFromFile()
        
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
        tasks.remove(at: indexPath.row)
        
        return addTaskTableViewController
        
        
    }
        
  
    
    func checkMarkTapped(sender: TaskCell) {
      
        //sender.isDoneButton.isSelected.toggle()
        
        if let indexPath = tableView.indexPath(for: sender) {
            
            var task = tasks[indexPath.row]
            task.isCompleted.toggle()
            tasks[indexPath.row] = task
            tableView.reloadRows(at: [indexPath], with: .none)
           
            Task.saveToFile(tasks: tasks)
        }
        
        
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
        cell.isDoneBool = tasks[indexPath.row].isCompleted
        cell.currentTask = task
        cell.delegate = self
        
        cell.currentTask = task
        
        Task.saveToFile(tasks: tasks)
        
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
    
    override func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
        Task.saveToFile(tasks: tasks)
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
    }
 
    
    
}
