//
//  ViewController.swift
//  MusicWireframe
//
//  Created by Tyler Radke on 11/22/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var rewindButton: UIButton!
    
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var fastForwardButton: UIButton!
    
    @IBOutlet weak var albumImage: UIImageView!
    
    @IBOutlet weak var rewindBackground: UIView!
    
    @IBOutlet weak var playBackground: UIView!
    
    @IBOutlet weak var fastForwardBackground: UIView!
    
    var isPlaying = true {
        didSet {
            playButton.isSelected = isPlaying
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        playButton.setImage(UIImage(systemName: "pause.fill"), for: .selected)
        [rewindBackground, playBackground, fastForwardBackground].forEach { bgView in
            bgView.layer.cornerRadius = bgView.frame.width / 2
            
            bgView.clipsToBounds = true
            
            bgView.backgroundColor = .gray
            
          bgView.alpha = 0
            
        }
        
        // Do any additional setup after loading the view.
    }

    @IBAction func playButtonTapped(_ sender: UIButton) {
        isPlaying.toggle()
        
        if isPlaying {
            UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.1) {
                self.albumImage.transform = CGAffineTransform.identity
            }
        } else {
            UIView.animate(withDuration: 0.5) {
                self.albumImage.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }
            
        }
        
    }
    
    @IBAction func controlButton(_ sender: UIButton) {
        let background: UIView
        
        switch sender {
        case rewindButton:
            background = rewindBackground
        case playButton:
            background = playBackground
        case fastForwardButton:
            background = fastForwardBackground
        default:
            return
        }
        
        UIView.animate(withDuration: 0.25) {
            background.alpha = 0
            background.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            sender.transform = .identity
        } completion: { _ in
            background.transform = .identity
        }

    }
    
    @IBAction func controlTouchDown(_ sender: UIButton) {
        let background: UIView
        
        switch sender {
        case rewindButton:
            background = rewindBackground
        case playButton:
            background = playBackground
        case fastForwardButton:
            background = fastForwardBackground
        default:
            return
            
            
            
        }
        
        UIView.animate(withDuration: 0.25) {
            background.alpha = 0.3
            sender.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }
    }
    
}

