/*:
## Exercise - Methods
 
 A `Book` struct has been created for you below. Add an instance method on `Book` called `description` that will print out facts about the book. Then create an instance of `Book` and call this method on that instance.
 */
struct Book {
    var title: String
    var author: String
    var pages: Int
    var price: Double
    
    func description() {
        print("This book is called \(self.title). It was written by \(self.author), it is \(self.pages) pages long, and you can buy it for $\(self.price).")
    }
}

var harry = Book(title: "Harry Potter", author: "J.K. Rowling", pages: 450, price: 12.99)

print(harry.description())
//:  A `Post` struct has been created for you below, representing a generic social media post. Add a mutating method on `Post` called `like` that will increment `likes` by one. Then create an instance of `Post` and call `like()` on it. Print out the `likes` property before and after calling the method to see whether or not the value was incremented.
struct Post {
    var message: String = ""
    var likes: Int = 0
    var numberOfComments: Int = 0

    mutating func like() {
        likes += 1
    }
}

var test = Post()
print(test.likes)
test.like()
print(test.likes)

/*:
[Previous](@previous)  |  page 5 of 10  |  [Next: App Exercise - Workout Functions](@next)
 */
