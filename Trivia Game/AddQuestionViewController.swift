//
//  AddQuestionViewController.swift
//  Trivia Game
//
//  Created by Alex Richardson on 10/11/18.
//  Copyright © 2018 Alex Richardson. All rights reserved.
//

import UIKit

class AddQuestionViewController: UIViewController {
    
    @IBOutlet weak var questionText: UITextField!
    
    @IBOutlet weak var answer1: UITextField!
    
    @IBOutlet weak var answer2: UITextField!
    
    @IBOutlet weak var answer3: UITextField!
    
    @IBOutlet weak var answer4: UITextField!
    
    @IBOutlet weak var correctAnswerSet: UISegmentedControl!
    
    @IBOutlet weak var difficultySet: UISegmentedControl!
    
    
    var newQuestion: TriviaQuestion!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func showErrorAlert() {
        
        let errorAlert = UIAlertController(title: "Error", message: "Please enter text in ALL the fields or hit the back button", preferredStyle: .actionSheet)
        
        let dismissAction = UIAlertAction(title: "Close", style: .default, handler: nil)
        
        errorAlert.addAction(dismissAction)
        
        self.present(errorAlert, animated: true, completion: nil)
        
    }
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        
        guard let question = questionText.text, !question.isEmpty,
            let answer1 = answer1.text, !answer1.isEmpty,
            let answer2 = answer2.text, !answer2.isEmpty,
            let answer3 = answer3.text, !answer3.isEmpty,
            let answer4 = answer4.text, !answer4.isEmpty else {
                
                showErrorAlert()
                return
                
        }
        
        newQuestion = TriviaQuestion(question: questionText.text!, answers: [answer1, answer2, answer3, answer4], correctAnswerIndex: correctAnswerSet.selectedSegmentIndex)
        
        if difficultySet.selectedSegmentIndex == 0 {
            
            easyQuestions.append(newQuestion)
            
        } else if difficultySet.selectedSegmentIndex == 1 {
            
            mediumQuestions.append(newQuestion)
            
        } else if difficultySet.selectedSegmentIndex == 2 {
            
            hardQuestions.append(newQuestion)
            
        }
        
        self.performSegue(withIdentifier: "unwindToHome", sender: self)
        
        
        
        
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
        
    //}

