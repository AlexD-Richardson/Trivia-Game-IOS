//
//  ViewController.swift
//  Trivia Game
//
//  Created by Alex Richardson on 10/9/18.
//  Copyright © 2018 Alex Richardson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var actualScore: UILabel!
    
    @IBOutlet weak var question: UILabel!
    
    @IBOutlet weak var answerOne: UIButton!
    
    @IBOutlet weak var answerTwo: UIButton!
    
    @IBOutlet weak var answerThree: UIButton!
    
    @IBOutlet weak var answerFour: UIButton!
    
    var arrayChooser: Int!
    
    var score = 0 {
        
        didSet {
            
            actualScore.text = "$\(score)"
            
        }
        
    }
    
    var randomIndex : Int!
    
    var questions: [TriviaQuestion] = []
    
    var questionsPlaceholder: [TriviaQuestion] = []
    
    var currentQuestion : TriviaQuestion! {
        
        didSet {
            
            question.text = currentQuestion.question
            
            answerOne.setTitle(currentQuestion.answers[0], for: .normal)
            
            answerTwo.setTitle(currentQuestion.answers[1], for: .normal)
            
            answerThree.setTitle(currentQuestion.answers[2], for: .normal)
            
            answerFour.setTitle(currentQuestion.answers[3], for: .normal)
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if arrayChooser == 0 {
            
            questions.append(contentsOf: easyQuestions)
            
        } else if arrayChooser == 1 {
            
            questions.append(contentsOf: mediumQuestions)
            
        } else if arrayChooser == 2 {
            
            questions.append(contentsOf: hardQuestions)
            
        }
        getNewQuestions()
    }
    
    func resetGame() {
        
        score = 0
        
        if !questions.isEmpty {
            
            questionsPlaceholder.append(contentsOf: questions)
            
        }
        
        questions = questionsPlaceholder
        
        questionsPlaceholder.removeAll()
        
        getNewQuestions()
        
    }
    
    func getNewQuestions() {
        
        if questions.count > 0 {
        
        randomIndex = Int(arc4random_uniform(UInt32(questions.count)))
        
        currentQuestion = questions[randomIndex]
        } else {
            
            resetGame()
            
        }
    }
    
    
    // show an alert when the user gets the question right
    func showCorrectAnswerAlert (){
        
        let correctAlert = UIAlertController(title: "Correct", message: "\(currentQuestion.correctAnswer) was the correct answer", preferredStyle: .actionSheet)
        
        // UIAlertAction
        let closeAction = UIAlertAction(title:"close", style: .default) { _ in
            self.questionsPlaceholder.append(self.questions.remove(at: self.randomIndex))
            self.getNewQuestions()
        }
        
        // Add the action to the alert controller
        correctAlert.addAction(closeAction)
        // present the alert controller
        self.present(correctAlert,animated: true, completion: nil)
    }
    
    // show an alert when the user gets the question wrong
    func showIncorrectAnswerAlert(){
        
        let incorrectAlert = UIAlertController(title: "Incorrect", message: "That was the incorrect answer", preferredStyle: .actionSheet)
        
        
        // UIAlertAction
        let closeAction = UIAlertAction(title:"close", style: .default) { _ in
            self.questionsPlaceholder.append(self.questions.remove(at: self.randomIndex))
            self.getNewQuestions()
        }
        
        
        // Add the action to the alert controller
        incorrectAlert.addAction(closeAction)
        // present the alert controller
        self.present(incorrectAlert,animated: true, completion: nil)
    }
    
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        if sender.tag == currentQuestion.correctAnswerIndex {
            // they got the question right, so we need to let them know
            showCorrectAnswerAlert()
            score += 250000
        } else {
            // they got the question wrong, so we need to let them know
            showIncorrectAnswerAlert()
            
        }
    }
}
