//
//  QuestionArrays.swift
//  Trivia Game
//
//  Created by Alex Richardson on 10/10/18.
//  Copyright © 2018 Alex Richardson. All rights reserved.
//

import Foundation

var easyQuestions = [TriviaQuestion(question: "What fictional city is the home of Batman?", answers: ["Metropolis", "Central City", "Gotham",           "Atlantis"], correctAnswerIndex: 2),
    
                     TriviaQuestion(question: "Babe Ruth is associated with what sport?", answers: ["Football", "Soccer", "Basketball", "Baseball"], correctAnswerIndex: 3),
                     
                     TriviaQuestion(question: "What's the total number of dots on a pair of dice?", answers: ["25", "34", "40", "42"], correctAnswerIndex: 3),
                     
                     TriviaQuestion(question: "What planet is closest to earth?", answers: ["Venus", "Pluto", "Jupiter", "Mars"], correctAnswerIndex: 0)]


var mediumQuestions = [TriviaQuestion(question: "What is the longest bone in your body?", answers: ["Tibia", "Femur", "Humerus", "Cranium"], correctAnswerIndex: 1),
                       
                       TriviaQuestion(question: "What president is on the $50 bill?", answers: ["Ulysses S. Grant", "Andrew Jackson", "Dwight D. Eisenhower", "Ronald Reagan"], correctAnswerIndex: 0),
                       
                       TriviaQuestion(question: "What is the first letter on a typewriter?", answers: ["A", "G", "Q", "I"], correctAnswerIndex: 2),
                       
                       TriviaQuestion(question: "What is the only man made object that is observable from the moon?", answers: ["Eiffel Tower", "The Great Wall of China", "Burj Khalifa Building", "Shanghai Tower"], correctAnswerIndex: 1)]


var hardQuestions = [TriviaQuestion(question: "Which space craft set off for Jupiter in 1972?", answers: ["Voyager 1", "Mariner 4", "Viking 1", "Pioneer 10"], correctAnswerIndex: 3),
                    
                    TriviaQuestion(question: "What is the legislature of the Netherlands called?", answers: ["General Council", "National Assembly", "The States General", "Federal Parliament "], correctAnswerIndex: 2),
                    
                    TriviaQuestion(question: "Who won Super Bowl X?", answers: ["Baltimore Ravens", "Arizona Cardinals", "New England Patriots", "Pittsburgh Steelers"], correctAnswerIndex: 3),
                    
                    TriviaQuestion(question: "When was the first Scrabble World Championship held?", answers: ["1991", "1989", "1995", "1997"], correctAnswerIndex: 0),
                    
                    TriviaQuestion(question: "Which is northernmost point of land on the Earth?", answers: ["The summit of Mount Everest", "Filchner-Ronne Ice Shelf", "Attu Island", "Kaffeklubben Island"], correctAnswerIndex: 3)]
