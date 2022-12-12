import UIKit

func twoStrings(a: String, b: String) -> String {
    return (a.count > b.count) ? b+a+b : a+b+a
}

twoStrings(a: "112", b: "4")
