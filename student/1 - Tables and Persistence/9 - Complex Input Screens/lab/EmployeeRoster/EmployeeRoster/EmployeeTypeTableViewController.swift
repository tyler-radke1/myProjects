//
//  EmployeeTypeTableViewController.swift
//  EmployeeRoster
//
//  Created by Tyler Radke on 10/31/22.
//

import UIKit
protocol EmployeeTypeTableViewControllerDelegate {
    func didSelect(employeeType: EmployeeType)
}
class EmployeeTypeTableViewController: UITableViewController,EmployeeTypeTableViewControllerDelegate {
    
    

    var delegate: EmployeeTypeTableViewControllerDelegate?
    
    var employeeType: EmployeeType?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func didSelect(employeeType: EmployeeType) {
        self.employeeType = employeeType
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return EmployeeType.allCases.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "employeeType", for: indexPath)
        let type = EmployeeType.allCases[indexPath.row]
        
        // Configure the cell...
        var content = cell.defaultContentConfiguration()
        content.text = type.description
        
        
    
        cell.accessoryType = (employeeType == type) ? .checkmark : .none
        cell.contentConfiguration = content
        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        employeeType = EmployeeType.allCases[indexPath.row]
        if let type = employeeType {
            delegate?.didSelect(employeeType: type)
        }
        
        
        tableView.reloadData()
    }

}
