//
//  ViewController.swift
//  socialMediaVersion2
//
//  Created by Tyler Radke on 11/1/22.
//

import UIKit

class ViewController: UIViewController {
    
    var darkMode = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func darkModeToggle(_ sender: UISwitch) {
        
        
        UIApplication.shared.windows.forEach { window in
            
            window.overrideUserInterfaceStyle = darkMode ? .dark : .light
            darkMode.toggle()
        }
    }
    

}

