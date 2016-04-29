//: Playground - noun: a place where people can play

import UIKit

class Shape {
    
    var id : String
    
    init(id: String) {
        self.id = id
    }
    
    func draw() {
        assert(false, "override")
    }
    
    func clone() -> AnyObject {
        let clone = Shape(id: self.id)
        return clone
    }
}

class Rectangle: Shape {
    init() {
        super.init(id: "")
        self.id = "Rectangle"
    }
    
    override func draw() {
        print("draw rectangle")
    }
}

class Circle: Shape {
    init() {
        super.init(id: "")
        self.id = "Circle"
    }
    override func draw() {
        print("draw circle")
    }
}

class ShapeCache {
    private static var shapeMap : [String: Shape] = [:]
    
    static func getShape(shapeId: String) -> Shape? {
        if let shape = ShapeCache.shapeMap[shapeId] {
            return shape.clone() as? Shape
        } else {
            return nil
        }
    }
    
    static func loadCache() {
        let circle = Circle()
        shapeMap[circle.id] = circle
        
        let rectangle = Rectangle()
        shapeMap[rectangle.id] = rectangle
    }
}

ShapeCache.loadCache()

let clonedShape = ShapeCache.getShape("Circle")

clonedShape?.draw()


