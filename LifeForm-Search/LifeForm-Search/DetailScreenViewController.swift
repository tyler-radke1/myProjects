//
//  DetailScreenViewController.swift
//  LifeForm-Search
//
//  Created by Tyler Radke on 1/22/23.
//

import UIKit

class DetailScreenViewController: UIViewController {

    @IBOutlet weak var animalImageView: UIImageView!
    
    var animalToShow: Animal? = nil
  
    @IBOutlet weak var scientifcNameLabel: UILabel!
    
    var taxonObject: TaxonObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let animalId = animalToShow?.id {
            sendPageRequest(id: animalId)
        }
        
        scientifcNameLabel.text = taxonObject?.scientificName
        // Do any additional setup after loading the view.
    }
    
    func sendPageRequest(id: Int) {
        Task {
            let request = PageRequest(animalID: String(id))
            
            let data = try await URLSession.shared.data(for: request.urlRequest)
        
            let page = try request.decodeResponse(data: data.0)
            
            taxonObject = page.taxonConcept
            
            scientifcNameLabel.text = taxonObject?.scientificName
            
        }
      
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
