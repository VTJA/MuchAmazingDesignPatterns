//: Playground - noun: a place where people can play

import UIKit

protocol Shape {
    func draw()
}

class Rectangle: Shape {
    func draw() {
        print("Drawing a rectangle")
    }
}

class Circle: Shape {
    func draw() {
        print("Drawing a circle")
    }
}

class ShapeDecorator: Shape {
    private var decoratedShape: Shape
    
    init(decoratedShape: Shape) {
        self.decoratedShape = decoratedShape
    }
    
    func draw() {
        decoratedShape.draw()
    }
}

class RedShapeDecorator: ShapeDecorator {
    
    override func draw() {
        decoratedShape.draw()
        setRedBorder(decoratedShape)
    }
    
    private func setRedBorder(decoratedShape: Shape) {
        print("BorderColor : Red")
    }
}

let circle = Circle()

let redCircle = RedShapeDecorator(decoratedShape: Circle())

let redRectangle = RedShapeDecorator(decoratedShape: Rectangle())

circle.draw()

redCircle.draw()

redRectangle.draw()