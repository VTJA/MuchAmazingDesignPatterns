//: Playground - noun: a place where people can play

import UIKit

protocol Expression {
    func interpret(context: String) -> Bool
}

class TerminalExpression: Expression {
    private let data : String
    
    init(data: String) {
        self.data = data
    }
    
    func interpret(context: String) -> Bool {
        if context.containsString(data) {
            return true
        }
        return false
    }
}

class OrExpression: Expression {
    
    private var expr1: Expression! = nil
    private var expr2: Expression! = nil
    
    init(expr1: Expression, expr2: Expression) {
        self.expr1 = expr1
        self.expr2 = expr2
    }
    
    func interpret(context: String) -> Bool {
        
        return expr1.interpret(context) || expr2.interpret(context)

    }
}

class AndExpression: Expression {
    
    private var expr1: Expression! = nil
    private var expr2: Expression! = nil
    
    init(expr1: Expression, expr2: Expression) {
        self.expr1 = expr1
        self.expr2 = expr2
    }
    
    func interpret(context: String) -> Bool {
        
        return expr1.interpret(context) && expr2.interpret(context)
        
    }
}

func getMaleExpression() -> Expression {
    let robert = TerminalExpression(data: "Robert")
    let bob = TerminalExpression(data: "Bob")
    return OrExpression(expr1: robert, expr2: bob)
}

func getMarriedWomanExpression() -> Expression {
    let veronica = TerminalExpression(data: "Ann")
    let maried = TerminalExpression(data: "Maried")
    return AndExpression(expr1: veronica, expr2: maried)
}

let isMale = getMaleExpression()
let isMarriedWoman = getMarriedWomanExpression()

print("Bob is male? \(isMale.interpret("Bob"))")
print("Veronica is married woman? \(isMarriedWoman.interpret("Ann"))")