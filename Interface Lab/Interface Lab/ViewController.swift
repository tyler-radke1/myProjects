//
//  ViewController.swift
//  Interface Lab
//
//  Created by Tyler Radke on 8/31/22.
//

import UIKit


class ViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var mainLabel: UILabel!
    
    @IBAction func button(_ sender: Any) {
        mainLabel.text = "This app Rocks!!"
    
}

}
