//
//  ViewController.swift
//  familyIntroduction
//
//  Created by Tyler Radke on 9/23/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var familyButtons: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBSegueAction func familySegueAction(_ coder: NSCoder) -> aboutFamilyView? {
        
        return aboutFamilyView(familyMember: <#T##FamilyMember#>, coder: coder)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    }
    @IBAction func familyButtonsTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "aboutFamily", sender: nil)
        
        
        
        
        
    }
    
    
    
}
