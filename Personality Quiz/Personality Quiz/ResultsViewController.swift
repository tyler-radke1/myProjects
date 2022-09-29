//
//  ResultsViewController.swift
//  Personality Quiz
//
//  Created by Tyler Radke on 9/29/22.
//

import UIKit

class ResultsViewController: ViewController {

   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var responses: [characterYouAre] = []
    
    init?(coder: NSCoder, responses: [characterYouAre]) {
        self.responses = responses
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var resultsBigLabel: UILabel!
    
    @IBOutlet weak var resultsSmallLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        resultsBigLabel.text = "\(responses[2])"
        resultsSmallLabel.text = "\(responses[2].definition)"
        
        
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
