//
//  CreateViewController.swift
//  socialMediaVersion2
//
//  Created by Tyler Radke on 11/1/22.
//

import UIKit
protocol PostsTableViewControllerDelegate {
    func addPost(post: Post)
    
    
}
class CreateViewController: UIViewController {

    @IBOutlet weak var postTextView: UITextView!
    
    
    var post: Post?
    var delegate: PostsTableViewControllerDelegate?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    

    @IBAction func postButtonTapped(_ sender: UIButton) {
        post = Post(content: postTextView.text)
        
        if let postToSend = post {
            delegate?.addPost(post: postToSend)
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
