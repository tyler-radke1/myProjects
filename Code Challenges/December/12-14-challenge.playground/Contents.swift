import UIKit

 


func filteredList(words: [String]) -> [String] {
    let geese = ["African", "Roman Tufted", "Toulouse", "Pilgrim", "Steinbacher"]
    
    
    return words.filter( { !geese.contains($0) } )
    
    
    
}

filteredList(words: ["Mallard", "Hook Bill", "African", "Crested", "Pilgrim", "Toulouse", "Blue Swedish"])
