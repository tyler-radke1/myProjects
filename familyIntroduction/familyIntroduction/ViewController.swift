//
//  ViewController.swift
//  familyIntroduction
//
//  Created by Tyler Radke on 9/23/22.
//

import UIKit

class ViewController: UIViewController {
  


    
    @IBOutlet weak var wifeButton: UIButton!
    @IBOutlet weak var connerButton: UIButton!
    @IBOutlet weak var bridgerButton: UIButton!
    @IBOutlet weak var sumnerButton: UIButton!
    @IBOutlet weak var landerButton: UIButton!
    @IBOutlet weak var porterButton: UIButton!
    @IBOutlet weak var mattieButton: UIButton!
    @IBOutlet weak var meButton: UIButton!
    @IBOutlet weak var parentsButton: UIButton!
    @IBOutlet weak var annieButton: UIButton!
    @IBOutlet weak var halieButton: UIButton!
    @IBOutlet weak var dogButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
   
    @IBAction func familyButtonsTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "aboutFamily", sender: nil)
        
        switch sender {
        case wifeButton:
            currentFamily = wife
            
        case dogButton:
            currentFamily = dog
            
        case connerButton:
            currentFamily = conner
            
        case bridgerButton:
            currentFamily = bridger
            
        case sumnerButton:
            currentFamily = sumner
            
        case landerButton:
            currentFamily = lander
            
        case porterButton:
            currentFamily = porter
            
        case mattieButton:
            currentFamily = mattie
            
        case halieButton:
            currentFamily = halie
            
        case annieButton:
            currentFamily = annie
            
        case parentsButton:
            currentFamily = parents
            
        default:
            currentFamily = me
            
            
        }

            
        
        
        
        
        
    }
    
    
    
}
