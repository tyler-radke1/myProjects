//
//  ViewController.swift
//  Guided Light
//
//  Created by Tyler Radke on 9/2/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    var lightToggle = false
    @IBAction func light(_ sender: Any) {
        
        lightToggle.toggle()
        if lightToggle == true {
            view.backgroundColor = .white
        } else {
            view.backgroundColor = .black
        }
    }
    
}

