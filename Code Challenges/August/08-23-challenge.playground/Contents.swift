import UIKit

struct Rectangle {
    var width: Int
    var height: Int
    
    func area() -> Int {
        return width * height
    }
    
    func perimeter() -> Int{
        return (width * 2) + (height * 2)
    }
    
    mutating func scale(by num: Int){
        self.width *= num
        self.height *= num
    }
}

var shape = Rectangle(width: 10, height: 12)

shape.scale(by: 4)

print(shape)

