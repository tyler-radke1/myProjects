import UIKit

func sentenceCount(par: String) -> Int {
    var count = 0
    let punc = ".?!"
    for c in par {
        count += (punc.contains(c)) ? 1 : 0
    }
    
    return count
}

sentenceCount(par: "Is this a sentence? Yes, this is a sentence. Do you like churros? Yes, I like churros!")
