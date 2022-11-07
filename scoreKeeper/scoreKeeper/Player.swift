//
//  File.swift
//  scoreKeeper
//
//  Created by Tyler Radke on 11/2/22.
//

import Foundation
import UIKit

struct Player: Comparable {
    static func < (lhs: Player, rhs: Player) -> Bool {
        return lhs.score > rhs.score
    }

    var name: String
    var score: Int
    var profileColor: UIColor
    
    static var players: [Player] = [Player(name: "Player 1", score: 5, profileColor: .blue), Player(name: "Player 2", score: 10, profileColor: .orange), Player(name: "Player 3", score: 15, profileColor: .blue), Player(name: "Player 4", score: 20, profileColor: .darkGray)]
}
