import UIKit

func getDate(hourBall: Int, bottomMinute: Int, topMinute: Int) -> String {
    guard hourBall > 0, bottomMinute > 0, topMinute > 0 else {
        return "not a valid time"
    }
    let time = (hour: hourBall, minutes: ((bottomMinute - 1) * 5) + (topMinute - 1))
    var solution = "The time is \(time.hour):"
    solution += (time.minutes == 0) ? "00" : "\(time.minutes)"
    
    return solution
    
}


getDate(hourBall: 2, bottomMinute: 1, topMinute: 3)
