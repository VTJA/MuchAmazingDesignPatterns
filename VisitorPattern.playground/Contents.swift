//: Playground - noun: a place where people can play

import UIKit

protocol ComputerPart {
    func accept(computerPartVisitor: ComputerPartVisitor)
}

class Monitor: ComputerPart {
    func accept(computerPartVisitor: ComputerPartVisitor) {
        computerPartVisitor.visit(self)
    }
}

class Keyboard: ComputerPart {
    func accept(computerPartVisitor: ComputerPartVisitor) {
        computerPartVisitor.visit(self)
    }
}

class Mouse: ComputerPart {
    func accept(computerPartVisitor: ComputerPartVisitor) {
        computerPartVisitor.visit(self)
    }
}

protocol ComputerPartVisitor {
    func visit(computer: Computer)
    func visit(mouse: Mouse)
    func visit(keyboard: Keyboard)
    func visit(monitor: Monitor)
}

class Computer: ComputerPart {
    var parts : [ComputerPart]
    init(parts: [ComputerPart]) {
        self.parts = parts
    }
    
    func accept(computerPartVisitor: ComputerPartVisitor) {
        for i in 0...parts.count - 1 {
            parts[i].accept(computerPartVisitor)
        }
        computerPartVisitor.visit(self)
    }
}

class ComputerPartDisplayVisitor: ComputerPartVisitor {
    func visit(computer: Computer) {
        print("displaying computer")
    }
    func visit(mouse: Mouse) {
        print("displaying mouse")
    }
    func visit(monitor: Monitor) {
        print("displaying monitor")
    }
    func visit(keyboard: Keyboard) {
        print("displaying keyboard")
    }
}



let parts :[ComputerPart] = [Monitor(), Keyboard(), Mouse()]
let computer = Computer(parts: parts)
computer.accept(ComputerPartDisplayVisitor())
