//
//  FamilyViewController.swift
//  familyIntroduction
//
//  Created by Tyler Radke on 9/23/22.
//


import UIKit

class FamilyViewController: ViewController {
    
    
    var currentFamilyMember: FamilyMember?
    
    @IBOutlet weak var familyLabel: UILabel!
    
    @IBOutlet weak var aboutFamilyTextView: UITextView!
    
    @IBOutlet weak var picOfFamily: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let currentFamilyMember = currentFamilyMember {
            familyLabel.text = currentFamilyMember.name
            aboutFamilyTextView.text = currentFamilyMember.description
            picOfFamily.image = UIImage(named: currentFamilyMember.name)
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       // guard let currentFamilyMember = currentFamilyMember else { return }
        
       
        
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
