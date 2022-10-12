import UIKit

func sheep(animalArray: [String]) -> String {
   
    guard animalArray.contains("wolf") else {return "All your sheep are safe."}

    let count = animalArray.count
    
    for (index, animal) in animalArray.enumerated() {
        if animal == "wolf" {
            return (index+1 != count) ? "Oi!, Sheep number \(count - (index + 1)), You are about to be eaten by a wolf" : "Pls go away and stop eating my sheep"
        }
    }
    
    return "no"
    
}

 sheep(animalArray: ["Sheep", "Sheep" , "Sheep", "Sheep", "Sheep", "Sheep", "Wolf"])
