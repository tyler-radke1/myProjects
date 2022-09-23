//
//  ViewController.swift
//  Calculator Lab
//
//  Created by Tyler Radke on 9/2/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var inputLabel: UILabel!
    @IBOutlet var numberButtons: [UIButton]!
    @IBOutlet var operands: [UIButton]!
    @IBOutlet weak var equals: UIButton!
    
    var operate = false
    var hasDec = false
    var hasAns = false
    var operandUsed: String = ""
    var answer: Double = 0
    
    var secondHalf = ""
    
    
    var firstValue = ""
    var secondValue = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //Ac Button - clears all values of the calculator
    func resetCalc() {
        operate = false
        hasDec = false
        hasAns = false
        operandUsed = ""
        answer = 0
        secondHalf = ""
        firstValue = ""
        secondValue = ""
        inputLabel.text = ""
    }
    
   func operationCheck() {
        //Appropriately sets either the first or second value, depending the operator bool
        if operate == false {
            firstValue = inputLabel.text!
        } else {
            secondValue = inputLabel.text!
        }
    }
    
    @IBAction func numberButtonsPush(_ sender: UIButton) {
        //if there is a no operand yet, sets the first value
        // if there IS an operand selected, sets the second value
        //if it's in decimal mode, it adds the trail
    
        
        
        //MARK: Decimal Mode
        if hasDec == true {
            //while the dec bool is true, the numbers just alter the tail
            secondHalf += sender.configuration!.title!
            //based on the operate bool, makes sure the secondHalf fixes the right number
            if operate == false {
                inputLabel.text = firstValue + "." + secondHalf
            } else {
                inputLabel.text = secondValue + "." + secondHalf
            }
        }
        
        if hasDec == false {
            if operate == false {
                firstValue += sender.configuration!.title!
                inputLabel.text = firstValue
            } else {
                
                if hasAns == true {
                    inputLabel.text = ""
                }
                secondValue += sender.configuration!.title!
                inputLabel.text = secondValue
            }
            
        }
    }
    
    @IBAction func decimalButton(_ sender: UIButton) {
        hasDec = true
        inputLabel.text = inputLabel.text! + secondHalf
        
    }
    func hasDecCheck() {
        //if theres a decimal, sets the input value to the appropriate number
        if hasDec == true {
            if operate == false {
                firstValue = inputLabel.text!
            } else if operate == true {
                secondValue = inputLabel.text!
            }
        }
    }
    
    @IBAction func operandsButtonPush(_ sender: UIButton) {
        //sends the the operand button to true and stores which operand was selected
        
        hasDecCheck()
        
        
        
        if hasAns == true {
            //if theres already an answer stored, lets you chain equations together
            firstValue = String(answer)
        }
        
        operandUsed = sender.configuration!.title!
        hasDec = false
        operate = true
    }
    
    @IBAction func percentage(_ sender: Any) {
        //calculates the percentage given
        answer = Double(inputLabel.text!)! / 100
        inputLabel.text = String(answer)
        
        operationCheck()
    }
    
    @IBAction func negativeButton(_ sender: Any) {
        //if the given input is greater than zero, calculates the reverse by mulitplying it by 2 and subracting
        //if the given number is already negative, gives the absolute value
        if Double(inputLabel.text!)! > 0 {
            answer = Double(inputLabel.text!)! - (Double(inputLabel.text!)! * 2)
        } else {
            answer = abs(Double(inputLabel.text!)!)
        }
        
        inputLabel.text = String(answer)
        
      operationCheck()
        
        truncatingCheck()
        
    }
    
    func truncatingCheck() {
        //if there is a truncating remainder, it gives you the answer as an integer
        //if there is, it gives you the answer as a double
        //used for the equals and sign flip buttons
        
        if answer.truncatingRemainder(dividingBy: 1) == 0 || inputLabel.text == "0"{
            inputLabel.text = String(Int(answer))
        } else {
            
            //caps the trail for decimals at 6 digits
            var numberFormatter = NumberFormatter()
            numberFormatter.maximumFractionDigits = 6
            
            inputLabel.text = numberFormatter.string(from: answer as NSNumber)
        }
        
        firstValue = String(answer)
        secondValue = ""
    }
    
    @IBAction func equalsButton(_ sender: UIButton) {
        //marks that there is now a stored answer
        
        hasAns = true
        hasDecCheck()
        hasDec = false
        
        guard firstValue != nil, secondValue != nil else {return answer = 0}
        
        switch operandUsed {
            
        case "*":
            answer = (Double(firstValue)! * Double(secondValue)!)
        case "+":
            answer = (Double(firstValue)! + Double(secondValue)!)
        case "-":
            answer = (Double(firstValue)! - Double(secondValue)!)
        case "/":
            guard (Double(secondValue) != 0) else {return inputLabel.text = "Error"}
            
            answer = (Double(firstValue)! / Double(secondValue)!)
        case "":
            inputLabel.text = "0"
        default:
            inputLabel.text = "Still Working"
            
        }
        
        truncatingCheck()
    
        
        
    }
    
    @IBAction func clearButton(_ sender: Any) {
        resetCalc()
    }
}
