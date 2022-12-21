//
//  MenuTableViewController.swift
//  orderingApp
//
//  Created by Tyler Radke on 12/6/22.
//

import UIKit

@MainActor
class MenuTableViewController: UITableViewController {
    
    let category: String
   
    var menuItems: [MenuItem] = []
    
    
    init?(coder: NSCoder, category: String) {
        self.category = category
        
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\(category.capitalized) Menu"
        Task.init {
            do {
                let menu = try await MenuController.shared.fetchMenuItems(forCategory: category)
                self.menuItems = menu
                tableView.reloadData()
            } catch {
            
                displayError(error, title: "Failed to fetch menu items for \(category)")
            }
            
            
        }
     
        
     
    }
    
    func updateUI(with menuItems: [MenuItem]) {
        self.menuItems = menuItems
        self.tableView.reloadData()
    }
    
    func displayError(_ error: Error, title: String) {
            guard let _ = viewIfLoaded?.window else { return }
        
            let alert = UIAlertController(title: title, message:
               error.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss",
               style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }

    @IBSegueAction func segueToMenuDetail(_ coder: NSCoder, sender: Any?) -> MenuItemDetail? {
        guard let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) else {
            return nil
        }
        
        let menuItem = menuItems[indexPath.row]
        
        return MenuItemDetail(coder: coder, menuItem: menuItem)
        
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return menuItems.count
    }

    func configure(_ cell: UITableViewCell, forItemAt indexPath: IndexPath) {
       
        
        
        
//        var content = cell.defaultContentConfiguration()
//        content.text = menuItem.name
//        content.secondaryText = menuItem.price.formatted(.currency(code: "usd"))
//        cell.contentConfiguration = content
//
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuItem", for: indexPath) as! MenuItemCell
        let menuItem = menuItems[indexPath.row]
        cell.itemNameLabel.text = menuItem.name
        cell.itemPriceLabel.text = menuItem.price.formatted(.currency(code: "usd"))
        Task {
            cell.itemImageView?.image = try await UIImage(data: MenuController.shared.fetchImage(menuItem: menuItem))
        }
       
       
        
        configure(cell, forItemAt: indexPath)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }

}
