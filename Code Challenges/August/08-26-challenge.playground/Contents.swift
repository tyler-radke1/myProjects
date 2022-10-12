import UIKit
import Darwin

func dist (x1: Double, x2: Double, y1: Double, y2: Double) -> Double {

    sqrt(pow((x2-x1), 2) + pow((y2-y1), 2))
}


dist(x1: 3, x2: 7, y1: 2, y2: 8)
