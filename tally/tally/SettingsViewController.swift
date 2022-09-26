//
//  SettingsViewController.swift
//  tally
//
//  Created by Tyler Radke on 9/26/22.
//

import UIKit

class SettingsViewController: ViewController {

    @IBOutlet weak var addOrSubtractText: UILabel!
    
    @IBOutlet weak var addOrSubButton: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tallyChanger(_ sender: UITextField) {
        
        if let value = Int(sender.text!) {
            countBy = value
        }
        
    }
    
 
    
    @IBAction func addOrSubTapped(_ sender: Any) {
        add.toggle()
        
        addOrSubtractText.text = (add) ? "Add" : "Subtract"
        
    }
    
    @IBAction func resetToTextField(_ sender: UITextField) {
        
        if let value = Int(sender.text!) {
            resetTo = value
        }
        
 
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
