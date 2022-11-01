//
//  FamilyTableViewController.swift
//  familyIntroduction
//
//  Created by Tyler Radke on 10/31/22.
//

import UIKit

class FamilyTableViewController: UITableViewController {
 
    
    var currentFamilyMember: FamilyMember?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @IBSegueAction func familyViewSegue(_ coder: NSCoder) -> FamilyViewController? {
        let familyViewController = FamilyViewController(coder: coder)
        
        
        
        
        
        return familyViewController

    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return FamilyMember.familyMembers.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "familyMember", for: indexPath)

        // Configure the cell...
        var content = cell.defaultContentConfiguration()
        
        content.text = FamilyMember.familyMembers[indexPath.row].name
        
        cell.contentConfiguration = content
        

        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentFamilyMember = FamilyMember.familyMembers[indexPath.row]
        
        performSegue(withIdentifier: "segueToFamily", sender: nil)
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let member = currentFamilyMember, let destination = segue.destination as? FamilyViewController{
            destination.currentFamilyMember = member
            
            
        }
    }

}
