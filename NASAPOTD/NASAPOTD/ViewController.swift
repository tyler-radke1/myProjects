//
//  ViewController.swift
//  NASAPOTD
//
//  Created by Tyler Radke on 11/30/22.
//

import UIKit
@MainActor

class ViewController: UIViewController {
    
    @IBOutlet weak var photoOfTheDay: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    let controller = PhotoInfoController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = ""
        photoOfTheDay.image = UIImage(systemName: "photo.on.rectangle")
        descriptionLabel.text = " "
        titleLabel.text = ""
        
        Task {
       
            do {
                let photoInfo = try await controller.fetchPhotoInfo()
                updateUI(with: photoInfo)
            } catch {
                self.title = "Error Fetching Photo"
                self.photoOfTheDay.image = UIImage(systemName:
                                                    "exclamationmark.octagon")
                self.descriptionLabel.text = error.localizedDescription
                self.titleLabel.text = ""
            }
            
        }
        
    }
    enum PhotoErrors: Error, LocalizedError {
        case youDoneMessedUp
    }
    
    
    func fetchImage(from : URL) async throws -> UIImage {
        
        let image = try await URLSession.shared.data(from: from)
        
        guard let httpResponse = image.1 as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw PhotoErrors.youDoneMessedUp
        }
        
        guard let pic = UIImage(data: image.0) else {
            throw PhotoErrors.youDoneMessedUp
        }
        
        return pic
      
    }
    
    func updateUI(with photoInfo: PhotoInfo) {
        Task {
            do {
                let image = try await fetchImage(from: photoInfo.url)
                
                title = photoInfo.title
                photoOfTheDay.image = image
                titleLabel.text = photoInfo.title
                descriptionLabel.text = photoInfo.description
            } catch {
                throw PhotoErrors.youDoneMessedUp
            }
            
            
            
        }
        
        
        
    }
    
}

