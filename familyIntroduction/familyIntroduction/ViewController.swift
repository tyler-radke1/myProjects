//
//  ViewController.swift
//  familyIntroduction
//
//  Created by Tyler Radke on 9/23/22.
//

import UIKit

class ViewController: UIViewController {
  


    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
   
    @IBAction func familyButtonsTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "aboutFamily", sender: nil)
    
        
        
        
        
    }
    
    
    
}
