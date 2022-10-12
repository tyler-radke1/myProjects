import UIKit

var greeting = "Hello, playground"

let name = "Tyler"
let age = 22
//using string interpolation
print("Hello, my name is \(name) and I'm \(age) years old")
      
//function that returns the length of a string
func letterCount(_ word: String) -> Int {
    let count = word.count
    return count
}

let myWord = letterCount("Hello")

print(myWord)

//function that returns the value of 2 numbers added together
func addTwoInts(_ num1: Int,_ num2: Int) -> Int {
    return num1 + num2
}

let twoNums = addTwoInts(6,7)

print(twoNums)
