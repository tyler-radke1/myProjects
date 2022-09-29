//
//  Question.swift
//  Personality Quiz
//
//  Created by Tyler Radke on 9/29/22.
//

import Foundation



enum characterYouAre {
    case shiz, teancum, ammon, amalickiah
   
    
    var definition: String {
        
        switch self {
        case .shiz:
            return "You are very reckless, and tend to just enjoy chaos."
        case .teancum:
            return "You are a very noble person, and you'll do what it takes to do whats right"
        case .ammon:
            return "You are a naturally protective person and want to take care of others."
        case .amalickiah:
            return "You are insane. You just want to watch the world burn."
        }
        
    }
    
    

    
}
struct Question {
    var question: String
    
    var answer1: String
    var answer2: String
    var answer3: String
    var answer4: String
    
    //var alignsWith: characterYouAre
    
}
