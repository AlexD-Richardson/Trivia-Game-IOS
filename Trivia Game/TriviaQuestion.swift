//
//  TriviaQuestion.swift
//  Trivia Game
//
//  Created by Alex Richardson on 10/9/18.
//  Copyright © 2018 Alex Richardson. All rights reserved.
//

import Foundation

class TriviaQuestion {
    
    let question: String
    
    let answers: [String]
    
    let correctAnswerIndex: Int
    
    //Computed Property that returns the correct answer for question
    var correctAnswer: String {
        
        return answers[correctAnswerIndex]
        
    }
    
    init(question: String, answers: [String], correctAnswerIndex: Int) {
        
        self.question = question
        
        self.answers = answers
        
        self.correctAnswerIndex = correctAnswerIndex
        
    }
    
    
    
}
