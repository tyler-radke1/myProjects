//
//  ViewController.swift
//  Password Checker
//
//  Created by Tyler Radke on 9/27/22.
//

import UIKit

class ViewController: UIViewController {
    var specialChars = "@,.!#$%^&*<>?+=-"
    
    
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var usernameTextFieldObject: UITextField!
    
    @IBOutlet weak var passwordTextFieldObject: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        errorLabel.text = ""
        let passAttempt = passwordTextFieldObject.text!
        var hasLower = false
        var hasUpper = false
        var hasSpecial = false
        var passed = false
        
        enum ErrorType {
            case lower, upper, special
        }
        var currentError: ErrorType = .special
        
        guard passAttempt.count >= 8 else {return errorLabel.text = "Your Password is not 8 characters"}
        
        //checks if it has an uppercase
        for char in passAttempt {
            hasUpper = (char.isUppercase) ? true : false
            if hasUpper {break}
        }
        
        //checks if theres a lowercase letter
        for char in passAttempt {
            hasLower = (char.isLowercase) ? true : false
            if hasLower {break}
        }
        
        //checks if it has a special character
        for char in passAttempt {
            hasSpecial = (specialChars.contains(char)) ? true : false
            if hasSpecial {break}
        }
        
        //checks the fail conditions and sets the right error type
        if !hasUpper {
            currentError = .upper
        } else if !hasLower {
            currentError = .lower
        } else if !hasSpecial {
            currentError = .special
        } else {
            passed = true
        }
        
        //if it passed, logs in. If it doesn't returns the error
        if (passed) {
            performSegue(withIdentifier: "goodPassword", sender: nil)
            
            //if it fails, gives the error message for the corresponding fail type
        } else {
            switch currentError {
            case .lower:
                errorLabel.text = "Your password does not contain a lowercase character."
            case .upper:
                errorLabel.text = "Your password needs an uppercase character."
            case .special:
                errorLabel.text = "Your password does not contain a special character."
            }
        }
        
        
    }
    
    @IBAction func usernameTyped(_ sender: UITextField) {
        var userCheck = sender.text!
        var hasAt = false
        
        for letter in userCheck {
            if letter ==
                "@" {
                hasAt = true
            }
            
            
        }
        
        
    }
    
}



