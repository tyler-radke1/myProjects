import UIKit
import PlaygroundSupport

let liveViewFrame = CGRect(x: 0, y: 0, width: 500, height: 500)
let liveView = UIView(frame: liveViewFrame)

liveView.backgroundColor = .white

PlaygroundPage.current.liveView = liveView

let smallFrame = CGRect(x: 0, y: 0, width: 100, height: 100)
let square = UIView(frame: smallFrame)
square.backgroundColor = .purple

liveView.addSubview(square)

UIView.animate(withDuration: 5, animations: {
    square.backgroundColor = .green
    let bigBoi = CGAffineTransform(scaleX: 3, y: 3)
    let rotatingBoi = CGAffineTransform(rotationAngle: .pi * 3)
    let centeringBoi = CGAffineTransform(translationX: 200, y: 200)
    
    let combined = bigBoi.concatenating(rotatingBoi).concatenating(centeringBoi)
    
    square.transform = combined
    
    
}) { _ in
    UIView.animate(withDuration: 5) {
        square.transform = .identity
    }
}
