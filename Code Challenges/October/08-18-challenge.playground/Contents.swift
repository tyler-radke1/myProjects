import UIKit

func date(string: String) -> Date? {
    
    let dateFormatter = DateFormatter()
    
    dateFormatter.dateFormat = "yyyy-MM-dd"
    
    return dateFormatter.date(from: string)
}

date(string: "2022-10-19")
