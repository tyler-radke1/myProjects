//
//  RepresentativeTableViewController.swift
//  dogApiLab
//
//  Created by Tyler Radke on 12/2/22.
//

import UIKit
import Foundation





class RepresentativeTableViewController: UITableViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    
    let failedRep = Representative(name: "Enter a valid area code", party: "n/a", district: "", state: "n/a")

    
    var reps: [Representative] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self

        Task {
            do {
                try await reps = Representative.getRepData(zipCode: "84045")
                tableView.reloadData()
            } catch {
                reps = [failedRep]
                tableView.reloadData()
                throw error
            }
        }
      
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    

    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        Task {
            do {
                try await reps = Representative.getRepData(zipCode: searchText)
                tableView.reloadData()
            } catch {
                reps = [failedRep]
                tableView.reloadData()
                throw error
            }
        }
        
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return reps.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "repCell", for: indexPath) as! RepresentativeTableViewCell
        let representative = reps[indexPath.row]
        
        cell.nameLabel.text = representative.name
        cell.stateLabel.text = "\(representative.state) - \(representative.district)"
        cell.partyLabel.text = representative.party
        
        // Configure the cell...

        return cell
    }
    

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }

   
}
