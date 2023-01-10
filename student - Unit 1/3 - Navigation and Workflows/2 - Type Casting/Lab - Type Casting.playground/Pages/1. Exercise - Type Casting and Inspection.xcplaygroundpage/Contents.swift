/*:
## Exercise - Type Casting and Inspection

 Create a collection of type [Any], including a few doubles, integers, strings, and booleans within the collection. Print the contents of the collection.
 */

import Foundation
var collection: [Any] = [0.0,2.6,"Hello", "World", false, 2, true, 45]
print(collection)
//:  Loop through the collection. For each integer, print "The integer has a value of ", followed by the integer value. Repeat the steps for doubles, strings and booleans.
for item in collection {
    if let item = item as? Int {
        print("This is an interger of value \(item)")
    } else if let item = item as? Double {
        print("This is a Double of value \(item)")
    } else if let item = item as? String {
        print("This is an String of value \(item)")
    } else if let item = item as? Bool {
        print("This is a bool of value \(item)")
    }
    
    
}

//:  Create a [String : Any] dictionary, where the values are a mixture of doubles, integers, strings, and booleans. Print the key/value pairs within the collection
var myDictionary: [String: Any] = ["Value1":"1.2", "Value two": "TEst", "Value 3": 34, "Val5": 0]



//:  Create a variable `total` of type `Double` set to 0. Then loop through the dictionary, and add the value of each integer and double to your variable's value. For each string value, add 1 to the total. For each boolean, add 2 to the total if the boolean is `true`, or subtract 3 if it's `false`. Print the value of `total`.
var total = 0.0

for (_, value) in myDictionary {
    
    if let value = value as? Int {
        total+=Double(value)
    } else if let value = value as? Double {
        total+=value
    } else if let value = value as? Bool {
        total+=(value == true) ? 2: -3
    } else if let value = value as? String {
        total+=1
    }

}

print(total)
//:  Create a variable `total2` of type `Double` set to 0. Loop through the collection again, adding up all the integers and doubles. For each string that you come across during the loop, attempt to convert the string into a number, and add that value to the total. Ignore booleans. Print the total.
var total2 = 0.0

for (_, value) in myDictionary {
    if let value = value as? Int {
        total2+=Double(value)
    } else if let value = value as? Double {
        total2+=value
    } else if let value = Int(value as! String){
        total2+=Double(value)
    } else if let value = Double(value as! String) {
        total2+=Double(value)
    }
    
    
}

print(total2)
/*:
page 1 of 2  |  [Next: App Exercise - Workout Types](@next)
 */
