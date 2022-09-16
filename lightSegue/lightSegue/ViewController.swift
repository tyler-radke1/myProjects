//
//  ViewController.swift
//  lightSegue
//
//  Created by Tyler Radke on 9/15/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var forgotUserButton: UIButton!
    
    @IBOutlet weak var forgotPassButton: UIButton!
    
    var forgot = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButton(_ sender: Any) {
        performSegue(withIdentifier: "Successful", sender: nil)
        
        
    }
    
    @IBAction func forgotUser(_ sender: Any) {
        forgot = true
        performSegue(withIdentifier: "forgottenUserPass", sender: nil)
       
    }
    @IBAction func forgotPass(_ sender: Any) {
        forgot = false
        performSegue(withIdentifier: "forgottenUserPass", sender: nil)
        
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "forgottenUserPass" && forgot == true{
            segue.destination.navigationItem.title = "Forgotten User Name"
        } else if segue.identifier == "forgottenUserPass" && forgot == false {
            segue.destination.navigationItem.title = "Forgotten Password"
        } else {
            segue.destination.navigationItem.title = username.text
        }
        
        
        
        
//        guard let sender = sender as? UIButton else {return}
//
//
//        switch sender {
//
//        case forgotUserButton:
//            segue.destination.navigationItem.title = "Forgotten Username"
//        case forgotPassButton:
//            segue.destination.navigationItem.title = "Forgotten Username"
//        default:
//            segue.destination.navigationItem.title = username.text
//
//        }
}
}
