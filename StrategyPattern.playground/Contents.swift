//: Playground - noun: a place where people can play

import UIKit

protocol Strategy {
    func doOperation(num1: Int, num2:Int) -> Int
}

class OperationAdd: Strategy {
    func doOperation(num1: Int, num2:Int) -> Int {
        return num1 + num2
    }
}

class OperationSubtract: Strategy {
    func doOperation(num1: Int, num2:Int) -> Int {
        return num1 - num2
    }
}

class OperationMultiply: Strategy {
    func doOperation(num1: Int, num2:Int) -> Int {
        return num1 * num2
    }
}

class OperationDivision: Strategy {
    func doOperation(num1: Int, num2:Int) -> Int {
        guard num2 == 0 else {
            return 0
        }
        return num1 / num2
    }
}

class Context {
    private let strategy : Strategy
    
    init(strategy: Strategy) {
        self.strategy = strategy
    }
    
    func executeStrategy(num1: Int, num2:Int) -> Int {
        return strategy.doOperation(num1, num2: num2)
    }
}

let add = OperationAdd()
let sub = OperationSubtract()
let multiply = OperationMultiply()
let division = OperationDivision()

var context = Context(strategy: add)
context.executeStrategy(10, num2: 5)

context = Context(strategy: multiply)

context.executeStrategy(10, num2: 5)


