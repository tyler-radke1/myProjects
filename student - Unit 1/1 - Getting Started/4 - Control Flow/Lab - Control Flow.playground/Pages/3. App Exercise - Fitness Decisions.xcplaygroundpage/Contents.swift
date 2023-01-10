/*:
## App Exercise - Fitness Decisions
 
 >These exercises reinforce Swift concepts in the context of a fitness tracking app.
 
 You want your fitness tracking app to give as much encouragement as possible to your users. Create a variable `steps` equal to the number of steps you guess you've taken today. Create a constant `stepGoal` equal to 10,000. Write an if-else statement that will print "You're almost halfway there!" if `steps` is less than half of `stepGoal`, and will print "You're over halfway there!" if `steps` is greater than half of `stepGoal`.
 */
var steps = 10

let stepGoal = 10000

if ((stepGoal) / 2 > steps) {
    print("You're almost halfway there!")
} else {
    print("You're more than halfway there!")
}

//:  Now create a new, but similar, if-else-if statement that prints "Way to get a good start today!" if `steps` is less than a tenth of `stepGoal`, prints "You're almost halfway there!" if `steps` is less than half of `stepGoal`, and prints "You're over halfway there!" if `steps` is greater than half of `stepGoal`.
if ((stepGoal) / 10  > steps) {
    print("Way to get a good start today!")
} else if ((stepGoal) / 2 > steps) {
    print("You're almost halfway there!")
}  else {
    print("You're more than halfway there!")
}
/*:
[Previous](@previous)  |  page 3 of 9  |  [Next: Exercise - Boolean Practice](@next)
 */
