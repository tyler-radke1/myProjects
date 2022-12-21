//
//  OrderConfirmationViewController.swift
//  orderingApp
//
//  Created by Tyler Radke on 12/20/22.
//

import UIKit

class OrderConfirmationViewController: UIViewController {

    let minutesToPrepare: Int
    
  
    @IBOutlet weak var confirmationLabel: UILabel!
    
    @IBOutlet weak var dismisssButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confirmationLabel.text = "Thank you for ordering, why don't you chill for like \(minutesToPrepare) minutes my dude."

        // Do any additional setup after loading the view.
    }
    
    init?(coder: NSCoder, minutesToPrepare: Int) {
        self.minutesToPrepare = minutesToPrepare
        super.init(coder: coder)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func dismissButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
