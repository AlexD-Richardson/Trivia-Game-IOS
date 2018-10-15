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
    
    @IBOutlet weak var moneyRaining: UIImageView!
    
    
    var arrayChooser: Int!
    
    var score = 0 {
        
        didSet {
            
            actualScore.text = "$\(score)"
            
        }
        
    }
    
    var colorArray = [UIColor.red, .blue, .green, .yellow, .orange, .magenta, .purple]
    
    var time = Timer()
    
    var gifTime = Timer()
    
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
        
        time.invalidate()
        
        self.view.backgroundColor = .white
        
        score = 0
        
        if !questions.isEmpty {
            
            questionsPlaceholder.append(contentsOf: questions)
            
        }
        
        questions = questionsPlaceholder
        
        questionsPlaceholder.removeAll()
        
        getNewQuestions()
        
    }
    
    func showGameOverAlert() {
        
        let gameOverAlert = UIAlertController(title: "Results", message: "Game Over! You were \(questions.count) questions away from being a Fake Millionaire!", preferredStyle: .actionSheet)
        
        let resetAction = UIAlertAction(title: "Reset", style: .default) { _ in self.resetGame()
            
        }
        
        gameOverAlert.addAction(resetAction)
        
        self.present(gameOverAlert, animated: true, completion: nil)
    }
    
    func getNewQuestions() {
        
        if questions.count > 0 {
            
            randomIndex = Int(arc4random_uniform(UInt32(questions.count)))
            
            currentQuestion = questions[randomIndex]
            
        } else if questions.count == 0 {
            
            moneyRaining.isHidden = false
            
            time = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(winnerBackground), userInfo: nil, repeats: true)
            
            gifTime = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(moneyDissapear), userInfo: nil, repeats: false)
            
            moneyRaining.image = UIImage.gifImageWithName("makeItRain")
            
            gifTime.fireDate = Date().addingTimeInterval(6)
            
            showWinnerAlert()
            
        } else {
            
            showGameOverAlert()
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
    
    @objc func showWinnerAlert() {
        
        let winnerAlert = UIAlertController(title: "WINNER!", message: "You are a Millonaire!!!", preferredStyle: .alert)
        
        let resetAction = UIAlertAction(title: "Reset", style: .default) { _ in self.resetGame()
            
        }
        
        winnerAlert.addAction(resetAction)
        
        
        self.present(winnerAlert, animated: true, completion: nil)
        
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        if sender.tag == currentQuestion.correctAnswerIndex {
            // they got the question right, so we need to let them know
            showCorrectAnswerAlert()
            score += 250000
        
        } else {
            // they got the question wrong, so we need to let them know
            
            showGameOverAlert()
            
            
        }
    }
    
    @objc func moneyDissapear() {
        moneyRaining.isHidden = true
    }
    
    
    //changes background
    @objc func winnerBackground() {
            let randomColor = colorArray[Int(arc4random_uniform(UInt32(colorArray.count)))]
            self.view.backgroundColor = randomColor
        }

}
