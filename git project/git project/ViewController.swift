//
//  ViewController.swift
//  git project
//
//  Created by Tyler Radke on 9/13/22.
//

import UIKit

class ViewController: UIViewController {

    var toggle = true
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changeColor(_ sender: Any) {
        view.backgroundColor = (toggle == true) ? .blue : .orange
        
        toggle.toggle()
        
    }
    
}

