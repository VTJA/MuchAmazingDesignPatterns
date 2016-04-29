//: Playground - noun: a place where people can play

import UIKit

class Memento {
    private let state: String
    
    init(state: String) {
        self.state = state
    }
    
    func getState() -> String {
        return self.state
    }
}

class Originator {
    private var state: String! = nil
    
    func setState(state: String) {
        self.state = state
    }
    
    func getState() -> String{
        return state
    }
    
    func saveStateToMemento() -> Memento {
        return Memento(state: state)
    }
    
    func getStateFromMemento(memento: Memento) {
        self.state = memento.getState()
    }
}

class CareTaker {
    var mementoList = [Memento]()
    
    func add(state: Memento) {
        mementoList.append(state)
    }
    
    func get(index: Int) -> Memento {
        return mementoList[index]
    }
}

let originator = Originator()
let careTaker = CareTaker()

originator.setState("State 1.")
originator.setState("State 2.")
careTaker.add(originator.saveStateToMemento())

originator.setState("State 3.")
careTaker.add(originator.saveStateToMemento())

originator.setState("State 4.")
print("current state: \(originator.getState())")

originator.getStateFromMemento(careTaker.get(0))
print("first saved state "+originator.getState())

originator.getStateFromMemento(careTaker.get(1))
print("second saved state "+originator.getState())


