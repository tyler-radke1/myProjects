//
//  ViewController.swift
//  dogApiLab
//
//  Created by Tyler Radke on 12/2/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageOfDog: UIImageView!
    
    let dogClass = DogClass()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func getDog() {
        do {
            Task {
                let dog = try await dogClass.dogRequest()
                let dogData = try await dogClass.fetchImage(dog: dog)
                
                if let dogData = dogData {
                    imageOfDog.image = UIImage(data: dogData)
                }
            }
        }
    }
    
 
    
}
