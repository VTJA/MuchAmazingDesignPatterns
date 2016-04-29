//: Playground - noun: a place where people can play

import UIKit

protocol DrawAPI {
    func drawCircle(radius: Int, x: Int, y: Int)
}

class RedCircle: DrawAPI {
    func drawCircle(radius: Int, x: Int, y: Int) {
        print("Drawing Circle color: red, radius:\(radius) ,x:\(x), y:\(y)")
    }
}

class GreenCircle: DrawAPI {
    func drawCircle(radius: Int, x: Int, y: Int) {
        print("Drawing Circle color: green, radius:\(radius) ,x:\(x), y:\(y)")
    }
}

class Shape {
    private let drawAPI : DrawAPI
    
    init(drawAPI: DrawAPI) {
        self.drawAPI = drawAPI
    }
    
    func draw() {
        assert(false, "override required")
    }
}

class Circle: Shape {
    private let x : Int
    private let y : Int
    private let radius : Int
    
    init(x: Int, y:Int, radius:Int, drawAPI: DrawAPI){
        self.x = x
        self.y = y
        self.radius = radius
        super.init(drawAPI: drawAPI)
    }
    override func draw() {
        drawAPI.drawCircle(radius, x: x, y: y)
    }
}

let redCircle = Circle(x: 100,y: 100,radius: 50, drawAPI: RedCircle())
redCircle.draw()

let greenCircle = Circle(x: 200, y: 175, radius: 25, drawAPI: GreenCircle())
greenCircle.draw()