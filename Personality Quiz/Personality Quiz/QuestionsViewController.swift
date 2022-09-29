//
//  QuestionsViewController.swift
//  Personality Quiz
//
//  Created by Tyler Radke on 9/29/22.
//

import UIKit

class QuestionsViewController: ViewController {
    var questionOn = 0
    var answersArray: [characterYouAre] = []
    @IBOutlet weak var QuestionLabel: UILabel!
    @IBOutlet weak var answerOne: UIButton!
    @IBOutlet weak var answerTwo: UIButton!
    @IBOutlet weak var answerThree: UIButton!
    @IBOutlet weak var answerFour: UIButton!
    
    var theQuestions: [Question] = [
        
        Question(question: "What is your favorite color", answer1: "Blue", answer2: "Green", answer3: "Yellow", answer4: "Red"),
        
        Question(question: "What is your favorite food?", answer1: "Lamb", answer2: "Hot dogs", answer3: "Hamburgers", answer4: "Pizza"),
        
        Question(question: "Which would you rather do?", answer1: "Defend the flocks of your master by fighting off invaders", answer2: "Skewer your enemies in their sleep with your spear", answer3: "Swear to drink the blood of your enemies", answer4: "Annihilate a civilation")
        
    ]
    
    func updateUi() {
        var currentQuestion = theQuestions[questionOn]
        
        QuestionLabel.text = currentQuestion.question
        answerOne.configuration!.title! = currentQuestion.answer1
        
        answerTwo.configuration!.title! = currentQuestion.answer2
        
        answerThree.configuration!.title! = currentQuestion.answer3
        
        answerFour.configuration!.title! = currentQuestion.answer4
        
    }
  
    func nextQuestion() {
        questionOn += 1
        
        if questionOn < theQuestions.count {
            updateUi()
        } else {
            performSegue(withIdentifier: "results", sender: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUi()
        // Do any additional setup after loading the view.
    }
    
    @IBSegueAction func resultsAction(_ coder: NSCoder) -> ResultsViewController? {
        
        return ResultsViewController(coder: coder, responses: answersArray)
    }
  
    @IBAction func testFunc(_ sender: Any) {
        updateUi()
    }
    
    @IBAction func theButtonsPressed(_ sender: UIButton) {
       
        
        switch sender {
        case answerOne:
            answersArray.append(.ammon)
        case answerTwo:
            answersArray.append(.teancum)
        case answerThree:
            answersArray.append(.amalickiah)
        case answerFour:
            answersArray.append(.shiz)
        default:
            break
        }
    
        nextQuestion()
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
