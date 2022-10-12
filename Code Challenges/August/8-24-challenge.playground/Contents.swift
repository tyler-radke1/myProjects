import UIKit


class Person {
    var name: String
    var age: Int
    var weight: Int
    
    init(name: String, age: Int, weight: Int)
}

class Student: Person {
    var currentClass: String
    var grade: Int
    var gpa: Double
    
    init(currentClass: String, grade: Int, gpa: Double, name: String, age: Int, weight: Int)
    super.init(name = name, age = age, weight = weight)
}

