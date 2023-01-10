/*:
## App Exercise - Ternary Messages

 >These exercises reinforce Swift concepts in the context of a fitness tracking app.

 The code below should look similar to code you wrote in the Fitness Decisions exercise. The if-else statement is actually unnecessary, and instead you can print either one statement or the other all on one line using the ternary operator. Go ahead and refactor the code below to do just that.
 */
let stepGoal = 10000
let steps = 123

if steps < stepGoal / 2 {
    print("Almost halfway!")
} else {
    print("Over halfway!")
}

print(steps < stepGoal ? "Almost Halfway": "Over halfway!")
