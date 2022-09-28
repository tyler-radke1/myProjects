//
//  ViewController.swift
//  tally
//
//  Created by Tyler Radke on 9/26/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterButton: UIButton!
    
    @IBOutlet weak var counter: UILabel!
    
    @IBOutlet weak var resetButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        
        
    }
    
   
    

    @IBAction func counterButtonTapped(_ sender: Any) {
        //total += countBy
        
        total += (add) ? countBy : (0 - countBy)
        
        counter.text = "\(total)"
    }
    
    @IBAction func resetButtonTapped(_ sender: Any) {
        total = resetTo
        counter.text = "\(total)"
        
    }
}

