import UIKit

func squareOrRect(l: Int, w: Int) -> Int {
    guard l == w else { print("rectangle"); return (l * 2) + (w * 2)}
    
    print("square")
    return l * w
    
    
    
}



squareOrRect(l: 5, w: 6)
