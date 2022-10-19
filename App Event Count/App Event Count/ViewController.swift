//
//  ViewController.swift
//  App Event Count
//
//  Created by Tyler Radke on 10/12/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var didFinishLaunchingLabel: UILabel!
    @IBOutlet weak var configurationForConnectingLabel: UILabel!
    @IBOutlet weak var willConnectToLabel: UILabel!
    @IBOutlet weak var didBecomeActiveLabel: UILabel!
    @IBOutlet weak var willResignActiveLabel: UILabel!
    @IBOutlet weak var willEnterForegroundLabel: UILabel!
    @IBOutlet weak var didEnterBackgroundLabel: UILabel!
  
    
    var willConnectCount = 0
    var didBecomeActiveCount = 0
    var willResignCount = 0
    var willEnterCount = 0
    var didEnterCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var appDelegate = (UIApplication.shared.delegate as! AppDelegate)
    
    func updateView() {
        didFinishLaunchingLabel.text = "didFinishLaunch \(appDelegate.launchCount) times"
        
        willConnectToLabel.text = "willConnect \(willConnectCount) times"
        
        didBecomeActiveLabel.text = "didBecomeActive \(didBecomeActiveCount) times"
        
        willResignActiveLabel.text = "willResign \(willResignCount) times"
        
        willEnterForegroundLabel.text = "willEnter \(willEnterCount) times"
        
        didEnterBackgroundLabel.text = "didEnter \(didEnterCount) times"
    }

    

}

