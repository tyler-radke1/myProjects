//
//  ViewController.swift
//  controls
//
//  Created by Tyler Radke on 9/1/22.
//

import UIKit

class ViewController: UIViewController {

    //Outlet for the label and text field
    @IBOutlet weak var label: UILabel!

    @IBOutlet weak var textOutlet: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    
    //Functions to set and clear the text field and label
    @IBAction func setText(_ sender: UIButton) {
        label.text = textOutlet.text
        
    }
    
    @IBAction func clearText(_ sender: UIButton) {
       textOutlet.text = ""
        label.text = ""
    }
    
    
   
  
}

