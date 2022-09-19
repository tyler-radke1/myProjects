//
//  MiddleViewController.swift
//  orderOfEvents
//
//  Created by Tyler Radke on 9/19/22.
//

import UIKit

class MiddleViewController: UIViewController {
   
    
    @IBOutlet weak var middleViewLabel: UILabel!
    
    var eventNumber = 1

    func addEvent(from: String) {
        if eventNumber > 22 {
            middleViewLabel.text = ""
            eventNumber = 0
        }
        
        if let existingText = middleViewLabel.text {
            middleViewLabel.text = "\(existingText)\nEvent number \(eventNumber) was \(from)"
            
            //
            eventNumber += 1
            
            //"From: \(from) \(eventNumber)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addEvent(from: "ViewDidLoad")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addEvent(from: "viewWillAppear")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addEvent(from: "ViewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        addEvent(from: "ViewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        addEvent(from: "ViewDidDisappear")
    }
   
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
