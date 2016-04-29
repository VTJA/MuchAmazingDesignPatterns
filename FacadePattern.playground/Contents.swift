//: Playground - noun: a place where people can play

import UIKit

protocol Shape {
    func draw()
}

class Square: Shape {
    func draw() {
        print("draws a square")
    }
}

class Circle: Shape {
    func draw() {
        print("draws a circle")
    }
}

class Rectangle: Shape {
    func draw() {
        print("draws a rectangle")
    }
}

class ShapeMaker {
    
    let circle = Circle()
    let rectangle = Rectangle()
    let square = Square()
    
    func drawCircle() {
        circle.draw()
    }
    
    func drawSquare() {
        square.draw()
    }
    
    func drawRectangle() {
        rectangle.draw()
    }
}

let facade = ShapeMaker()

facade.drawCircle()
facade.drawRectangle()
facade.drawSquare()