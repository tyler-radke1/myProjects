//
//  ViewController.swift
//  iSpy
//
//  Created by Tyler Radke on 10/17/22.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageOfPeyton: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       

        scrollView.delegate = self
        
        
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageOfPeyton
    }
    
    func updateZoomFor(size: CGSize) {
        let widthScale = size.width / imageOfPeyton.bounds.width
        let heightScale = size.height / imageOfPeyton.bounds.height
        let scale = min(widthScale, heightScale)
        
        scrollView.minimumZoomScale = scale
        scrollView.zoomScale = scale
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateZoomFor(size: view.bounds.size)
    }


}

