//
//  ViewController.swift
//  orderOfEvents
//
//  Created by Tyler Radke on 9/19/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func firstToSecond(_ sender: Any) {
        performSegue(withIdentifier: "firstToSecond", sender: nil)
    }
    
}

