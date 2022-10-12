import UIKit

class Person {
    var name: String
    var age: Int
    var height: Int
    var weight: Double
    
    func greet() {
        print("Hello, my name is \(name), and I'm \(age) years old")
    }
    
    func birth() {
        age+=1
    }
    
    init(name: String, age: Int, height: Int, weight: Double) {
        self.name = name
        self.age = age
        self.height = height
        self.weight = weight
    }
}

var individual = Person(name: "Shrek", age: 108, height: 00, weight: 450)

individual.greet()

individual.birth()

individual.greet()
