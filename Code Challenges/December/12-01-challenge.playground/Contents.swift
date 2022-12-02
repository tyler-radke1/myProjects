import UIKit

func duplicate(words: String) -> String {
    return words.map({ "\($0)\($0)"}).joined()
}
duplicate(words: "test")
duplicate(words: "Hello World!")
