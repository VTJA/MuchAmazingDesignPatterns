//: Playground - noun: a place where people can play

import UIKit
import Foundation

protocol Shape {
    func draw()
}

class Circle: Shape {
    var color: String
    var x : Int
    var y: Int
    var radius: Int
    
    init(x: Int, y: Int, radius: Int, color: String) {
        self.x = x
        self.y = y
        self.radius = radius
        self.color = color
    }
    
    convenience init(color: String) {
        self.init(x:0, y:0, radius:10, color: color)
    }
    
    func draw() {
        print("draw a circle on x:\(x) y:\(y) radius: \(radius) color: \(color)")
    }
}

class ShapeFactory {
    static var circleMap = [String:Shape]()
    
    static func getCircle(color: String) -> Shape {
        if let circle = circleMap[color] {
            return circle
        } else {
            let circle = Circle(color: color)
            circleMap[color] = circle
            print("Creating circle of color: \(color)")
            return circle
        }
    }
}

let colors = ["Red", "Green", "Blue", "White", "Black"]

for i in 1...20 {
    let randomIndex = Int(arc4random()%4)
    let circle = ShapeFactory.getCircle(colors[randomIndex]) as! Circle
    circle.x = Int(arc4random()%100)
    circle.y = Int(arc4random()%100)
    circle.radius = 100
    circle.draw()
}

