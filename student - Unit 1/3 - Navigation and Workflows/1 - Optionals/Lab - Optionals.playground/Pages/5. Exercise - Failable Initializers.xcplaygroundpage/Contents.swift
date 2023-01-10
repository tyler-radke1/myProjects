/*:
## Exercise - Failable Initializers

 Create a `Computer` struct with two properties, `ram` and `yearManufactured`, where both parameters are of type `Int`. Create a failable initializer that will only create an instance of `Computer` if `ram` is greater than 0, and if `yearManufactured` is greater than 1970, and less than 2020.
 */
struct Computer {
    var ram: Int
    var yearMan: Int
    
    init?(ram: Int, yearMan: Int) {
        if ram < 0 || (yearMan < 1970 || yearMan > 2020) {
            return nil
        } else {
            self.ram = ram
            self.yearMan = yearMan
        }
    }
}

//:  Create two instances of `Computer?` using the failable initializer. One instance should use values that will have a value within the optional, and the other should result in `nil`. Use if-let syntax to unwrap each of the `Computer?` objects and print the `ram` and `yearManufactured` if the optional contains a value.
var works = Computer(ram: 12, yearMan: 1989)
if let works = works {
    print(works)
} else {
    print("Computer 1 failed")
}
var noWork = Computer(ram: 12, yearMan: 1954)
if let noWork = noWork {
    print(noWork)
} else {
    print("Computer 2 failed")
}

/*:
[Previous](@previous)  |  page 5 of 6  |  [Next: App Exercise - Workout or Nil](@next)
 */
