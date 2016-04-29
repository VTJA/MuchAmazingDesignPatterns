//: Playground - noun: a place where people can play

import UIKit

protocol Shape {
    func draw()
}

protocol Color {
    func fill()
}

class Square: Shape {
    func draw() {
        print("draw a square")
    }
}

class Circle: Shape {
    func draw() {
        print("draw a circle")
    }
}

class Triangle: Shape {
    func draw() {
        print("draw a triangle")
    }
}

class Red: Color {
    func fill() {
        print("fill with red color")
    }
}

class Green: Color {
    func fill() {
        print("fill with green color")
    }
}

class Yellow: Color {
    func fill() {
        print("fill with yellow color")
    }
}

protocol AbstractFactory {
    func getColor(color: String) -> Color?
    func getShape(shape: String) -> Shape?
}

class ShapeFactory: AbstractFactory {
    func getShape(shape: String) -> Shape? {
        switch shape {
        case "Circle":
            return Circle()
        case "Square":
            return Square()
        case "Triangle":
            return Triangle()
            
        default:
            return nil
        }
    }
    
    func getColor(color: String) -> Color? {
        return nil
    }
}

class ColorFactory: AbstractFactory {
    func getColor(color: String) -> Color? {
        switch color {
        case "Red":
            return Red()
        case "Green":
            return Green()
        case "Yellow":
            return Yellow()
        default:
            return nil
        }
    }
    
    func getShape(shape: String) -> Shape? {
        return nil
    }
}

class FactoryProducer {
    func getFactory(factoryName: String) -> AbstractFactory? {
        switch factoryName {
        case "Shape":
            return ShapeFactory()
        case "Color":
            return ColorFactory()
        default:
            return nil
        }
    }
}

let shapeFactory = FactoryProducer().getFactory("Shape")

let square = shapeFactory!.getShape("Square")

square?.draw()



