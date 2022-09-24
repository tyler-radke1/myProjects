//
//  aboutFamilyView.swift
//  familyIntroduction
//
//  Created by Tyler Radke on 9/23/22.
//

import UIKit

class aboutFamilyView: UIViewController {
    
    var familyMember: FamilyMember

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    init?(familyMember: FamilyMember, coder: NSCoder) {
        self.familyMember = familyMember
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
