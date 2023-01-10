//
//  DetailViewController.swift
//  DirectoryAppTests
//
//  Created by Tyler Radke on 1/6/23.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    var person: Person = Person(name: "", phoneNumber: "69")
    
    
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Person.people.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let person = Person.people[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
    
        content.text = person.name
        content.secondaryText = person.phoneNumber
        
        return cell
        
    }
    
    
    
}
