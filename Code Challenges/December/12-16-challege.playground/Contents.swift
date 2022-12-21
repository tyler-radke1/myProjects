import UIKit

func headsAndLegs(headsLegs: [Int]) -> [Int] {
    guard headsLegs.reduce(0, +) > 0 else { return [0, 0]}
    
    //Array is chickens, cows
    
    let twoCows = headsLegs[1] - (2 * headsLegs[0])

    let cows = twoCows / 2
    
    let chicks = headsLegs[0] - cows
    
    return [chicks, cows]
    
  
    
}

headsAndLegs(headsLegs: [72,200])
