//
//  ViewController.swift
//  animationLab
//
//  Created by Tyler Radke on 11/22/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // emailTextField.backgroundColor = 
        // Do any additional setup after loading the view.
    }

    @IBAction func submitButtonTapped(_ sender: UIButton) {
        if emailTextField.hasText {
            performSegue(withIdentifier: "segueIdentifier", sender: nil)
        } else {
            
            let toTheRight = CGAffineTransform(translationX: 20, y: 0)
            
            let toTheLeft = toTheRight.concatenating(CGAffineTransform.identity)
            
            UIView.animate(withDuration: 0.1, animations: {
                self.emailTextField.transform = toTheRight
               
            }) { _ in
                self.emailTextField.transform = CGAffineTransform.identity
            }
            
            
        }
        
    }
    
}

