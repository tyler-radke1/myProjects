//
//  Emoji.swift
//  emojiDictionary
//
//  Created by Tyler Radke on 10/18/22.
//

import Foundation

struct Emoji: Codable {
    var symbol: String
    var name: String
    var description: String
    var usage: String
    
    static var defaultEmojis: [Emoji] = [
        Emoji(symbol: "π", name: "Grinning Face", description: "A typical smiley face.", usage: "happiness"),
        Emoji(symbol: "π", name: "Confused Face", description: "A confused, puzzled face.", usage: "unsure what to think; displeasure"),
        Emoji(symbol: "π", name: "Heart Eyes", description: "A smiley face with hearts for eyes.", usage: "love of something; attractive"),
        Emoji(symbol: "π§βπ»", name: "Developer", description: "A person working on a MacBook (probably using Xcode to write iOS apps in Swift).", usage: "apps, software, programming"),
        Emoji(symbol: "π’", name: "Turtle", description: "A cute turtle.", usage: "something slow"),
        Emoji(symbol: "π", name: "Elephant", description: "A gray elephant.", usage: "good memory"),
        Emoji(symbol: "π", name: "Spaghetti", description: "A plate of spaghetti.", usage: "spaghetti"),
        Emoji(symbol: "π²", name: "Die", description: "A single die.", usage: "taking a risk, chance; game"),
        Emoji(symbol: "βΊοΈ", name: "Tent", description: "A small tent.", usage: "camping"),
        Emoji(symbol: "π", name: "Stack of Books",description: "Three colored books stacked on each other.", usage: "homework, studying"),
        Emoji(symbol: "π", name: "Broken Heart", description: "A red, broken heart.", usage: "extreme sadness"), Emoji(symbol: "π€", name: "Snore", description: "Three blue \'z\'s.", usage: "tired, sleepiness"),
        Emoji(symbol: "π", name: "Checkered Flag", description: "A black-and-white checkered flag.", usage: "completion")
    ]
    
    static var saveLocation: URL {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
         return documentsDirectory.appendingPathComponent("emojis").appendingPathExtension("json")
    }
    
    static func saveToFile(emojis: [Emoji]) {
        
        do {
            let dataToEncode = try? JSONEncoder().encode(emojis)
            try dataToEncode?.write(to: saveLocation)
        } catch {
            print(error)
        }
    }
    
    
   static func loadFromFile() -> [Emoji] {
        
        var newEmojis: [Emoji] = []
       
    
       //Using a guard here makes it so it checks for emojis.JSON, and if it doesn't exist uses defaultEmojis
       guard let data: Data = try? Data(contentsOf: saveLocation) else { return defaultEmojis }
       
        do {
            let emojisArray: [Emoji] = try JSONDecoder().decode([Emoji].self, from: data)
            newEmojis = emojisArray
        } catch {
            print(error)
        }
       
        
       return newEmojis
        
        
    }
}


