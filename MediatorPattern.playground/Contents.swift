//: Playground - noun: a place where people can play

import UIKit
import Foundation

// Example 1

//change

class ChatRoom {
    static func showMessage(user: User, message: String) {
        print("\(NSDate()) \(user.getName()) \(message)")
    }
}

class User {
    private let name: String
    
    func getName() -> String {
        return self.name
    }
    
    init(name: String) {
        self.name = name
    }
    
    func sendMessage(message: String) {
        ChatRoom.showMessage(self, message: message)
    }
}

//Ex 1 Impl

let robert = User(name: "Robert")
let john = User(name: "John")

robert.sendMessage("sup dawg")
john.sendMessage("nothing muxh")

// Example 2

class Colleague {
    let name: String
    let mediator: Mediator
    
    init(name: String, mediator: Mediator) {
        self.name = name
        self.mediator = mediator
    }
    
    func send(message: String) {
        mediator.sendMessage(message, colleague: self)
    }
    
    func receive(message: String) {
         assert(false, "override required")
    }
}

protocol Mediator {
    func sendMessage(message: String, colleague: Colleague)
}

class MessageMediator: Mediator {
    private var colleagues = [Colleague]()
    
    func addColeague(colleague: Colleague) {
        colleagues.append(colleague)
    }
    
    func sendMessage(message: String, colleague: Colleague) {
        for c in colleagues {
            if c !== colleague {
                c.receive(message)
            }
        }
    }
}

class ConcreteColleague: Colleague {
    override func receive(message: String) {
        print("coll \(name) recv: \(message)")
    }
}

//Ex 2 Impl

let messageMediator = MessageMediator()

let user0 = ConcreteColleague(name: "0", mediator: messageMediator)
let user1 = ConcreteColleague(name: "1", mediator: messageMediator)
messageMediator.addColeague(user0)
messageMediator.addColeague(user1)
//stashed changes

user0.send("hello")
