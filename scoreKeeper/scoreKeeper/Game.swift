//
//  Game.swift
//  scoreKeeper
//
//  Created by Tyler Radke on 11/11/22.
//

import Foundation

class Game {
    
    var gameTitle: String
    
    var sortBy: Bool
    //false is low to high, true is high to low
    
    var players: [Player] = []
    var currentWinner: Player?
    
    init(gameTitle: String, sortBy: Bool, players: [Player], currentWinner: Player? = nil) {
        self.gameTitle = gameTitle
        self.sortBy = sortBy
        self.players = players
        self.players.sort()
        
       
        
    }
    
    func setGameWinner() {
        if players.count > 0 {
            self.currentWinner = (sortBy) ? players[0] : players[players.count-1]
        }
    }
    
    static var games: [Game] = [Game(gameTitle: "Monopoly", sortBy: true, players: [])]
}

