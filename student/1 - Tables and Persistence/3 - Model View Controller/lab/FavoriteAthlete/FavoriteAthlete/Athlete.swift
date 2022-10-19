//
//  Athlete.swift
//  FavoriteAthlete
//
//  Created by Tyler Radke on 10/17/22.
//


import Foundation

struct Athlete: Equatable {
    
    var name: String
    var age: Int
    var league: String
    var team: String
    var description: String
    init(name: String, age: Int, league: String, team: String) {
        self.name = name
        self.age = age
        self.league = league
        self.team = team
        
        self.description = "\(name) is \(age) years old and plays for the \(team) in the \(league)"
    }
    
    
    
}
