//
//  AthleteFormViewController.swift
//  FavoriteAthlete
//
//  Created by Tyler Radke on 10/17/22.
//

import UIKit


class AthleteFormViewController: UIViewController{
    
    var delegate: AthleteTableViewDelegate?
    
    var athleteToSend: Athlete?
    var athleteToEdit: Athlete?
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var ageField: UITextField!
    
    @IBOutlet weak var leagueField: UITextField!
    
    @IBOutlet weak var teamField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        
        
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let athlete = athleteToEdit {
            nameField.text = athlete.name
            ageField.text = String(athlete.age)
            leagueField.text = athlete.league
            teamField.text = athlete.team
            
        }
        
        
    }
    init?(coder: NSCoder, athlete: Athlete?) {
        super.init(coder: coder)
        self.athleteToEdit = athlete
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView() {
        guard let name = nameField.text,
              let ageString = ageField.text,
              let age = Int(ageString),
              let league = leagueField.text,
              let team = teamField.text else {return}
        
        athleteToSend = Athlete(name: name, age: age, league: league, team: team)
    }
    
    @IBAction func saveTapped(_ sender: UIButton) {
        updateView()
        // Call a delegate method
        if let athlete = athleteToSend {
            delegate?.delegateMethod(athlete: athlete)
        }
        
        
        navigationController!.popViewController(animated: true)
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
