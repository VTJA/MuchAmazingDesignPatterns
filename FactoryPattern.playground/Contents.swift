//: Playground - noun: a place where people can play

import UIKit

protocol Shape {
    func draw()
}

class Rectangle: Shape {
    func draw() {
        print("draw a rectangle code")
    }
}

class Square: Shape {
    func draw() {
        print("draw a square code")
    }
}

class Circle: Shape {
    func draw() {
        print("draw a circle code")
    }
}

class ShapeFactory {
    func getShape(shapeType: String?) -> Shape? {
        if let shapeType = shapeType {
            switch shapeType {
            case "Circle":
                return Circle()
            case "Rectangle":
                return Rectangle()
            case "Square":
                return Square()
            default:
                return nil
            }
        } else {
            return nil
        }
    }
}

let factory = ShapeFactory()

let circle = factory.getShape("Circle")

circle?.draw()