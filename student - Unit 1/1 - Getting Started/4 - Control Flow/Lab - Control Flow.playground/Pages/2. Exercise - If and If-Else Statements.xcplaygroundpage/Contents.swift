/*:
## Exercise - If and If-Else Statements
 
 Imagine you're creating a machine that will count your money for you and tell you how wealthy you are based on how much money you have. A variable `dollars` has been given to you with a value of 0. Write an if statement that prints "Sorry, kid. You're broke!" if `dollars` has a value of 0. Observe what is printed to the console.
 */
var dollars = 0

if (dollars == 0 ) {
    print("Sorry kid, you're broke")
}

//:  `dollars` has been updated below to have a value of 10. Write an an if-else statement that prints "Sorry, kid. You're broke!" if `dollars` has a value of 0, but prints "You've got some spending money!" otherwise. Observe what is printed to the console.
dollars = 10

if (dollars == 0 ) {
    print("Sorry kid, you're broke")
} else {
    print("You've got some spending money!")
}


/*:
[Previous](@previous)  |  page 2 of 9  |  [Next: App Exercise - Fitness Decisions](@next)
 */
