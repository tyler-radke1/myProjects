//
//  MenuItemDetail.swift
//  orderingApp
//
//  Created by Tyler Radke on 12/8/22.
//

import UIKit

class MenuItemDetail: UIViewController {
    
    var menuItem: MenuItem
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var detailTextView: UITextView!
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var orderButton: UIButton!
    var minutesToPrepareOrder = 0
    init?(coder: NSCoder, menuItem: MenuItem) {
        self.menuItem = menuItem
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("nooooo")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
        detailTextView.text = menuItem.detailText
        nameLabel.text = menuItem.name
        priceLabel.text = menuItem.price.formatted(.currency(code: "usd"))
        
        Task {
            imageView.image = try await UIImage(data: MenuController.shared.fetchImage(menuItem: menuItem))
        }
     
        
    }
    
   
    
   
    
    @IBAction func unwindToOrderList(segue: UIStoryboardSegue) {
        if segue.identifier == "dismissConfirmation" {
            MenuController.shared.order.menuItems.removeAll()
        }
    }
    
  
    @IBAction func orderButtonTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            self.orderButton.transform = CGAffineTransform(scaleX: 2, y: 2)
            self.orderButton.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
        
        
        MenuController.shared.order.menuItems.append(menuItem)
        print(MenuController.shared.order.menuItems)
        
    }
    
    
}
