//
//  FamilyViewController.swift
//  familyIntroduction
//
//  Created by Tyler Radke on 9/23/22.
//

import UIKit

class FamilyViewController: ViewController {

    
    
    @IBOutlet weak var familyLabel: UILabel!
    
    @IBOutlet weak var aboutFamilyTextView: UITextView!
    
    @IBOutlet weak var picOfFamily: UIImageView!
    
    func familyUpdate() {
        
        familyLabel.text = currentFamily.name
        aboutFamilyTextView.text = currentFamily.description
        picOfFamily.image = UIImage(named: "\(currentFamily.name)")
        
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        familyUpdate()
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
