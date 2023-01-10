/*:
## Exercise - Create Functions

 Write a function called `introduceMyself` that prints a brief introduction of yourself. Call the function and observe the printout.
 */
func introduceMyself () {
    print("My name Tyler. I am 22 years old. I like computers, video games and reading.")
}
introduceMyself()
//:  Write a function called `magicEightBall` that generates a random number and then uses either a switch statement or if-else-if statements to print different responses based on the random number generated. `let randomNum = Int.random(in: 0...4)` will generate a random number from 0 to 4, after which you can print different phrases corresponding to the number generated. Call the function multiple times and observe the different printouts.
import Foundation

func magicEight() {
    let randomNum = Int.random(in: 0...4)
    
    switch randomNum {
case 0:
    print("This ball will have no impact on your life whatsoever")
case 1:
    print("Try again later")
case 2:
    print("Sorry, the ball is hungry. Come back after lunch")
case 3:
    print("The ball has to pick up his kid from school. He'll be back later.")
case 4:
    print("The ball says no.")
default:
        print("The ball says maybe")
}
}

magicEight()
magicEight()
magicEight()
magicEight()


/*:
page 1 of 6  |  [Next: App Exercise - A Functioning App](@next)
 */
