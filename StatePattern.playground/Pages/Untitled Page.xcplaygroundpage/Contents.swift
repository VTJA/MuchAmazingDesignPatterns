//: Playground - noun: a place where people can play

import UIKit

protocol State {
    
    func doAction(context: Context)
}

class StartState: State {
    
    func doAction(context: Context) {
    print("system is in start state")
        context.setState(self)
    }
}

class StopState: State {
    
    func doAction(context: Context) {
     print("system is in stop state")
        context.setState(self)
    }
}

class Context {
    
    var state: State? = nil
    
    func setState(state: State) {
        self.state = state
    }
    
    func getState() -> State {
        return self.state!
    }
}

let context = Context()

let startState = StartState()

startState.doAction(context)

context.getState()

let stopState = StopState()

stopState.doAction(context)
