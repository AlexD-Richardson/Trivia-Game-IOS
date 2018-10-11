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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitButtonTapped(_ sender: Any) {
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
 

}
