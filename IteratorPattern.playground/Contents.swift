//: Playground - noun: a place where people can play

import UIKit

// Iterator Pattern


let names = ["Bob", "Tom", "Rob", "Jin", "Ann"]

protocol Iterator {
    
    func hasNext() -> Bool
    func next() -> String?
}

protocol Container {
    
    func getIterator() -> Iterator
}

public class NameRepository: Container {
    
    func getIterator() -> Iterator {
        return NameIterator()
    }
    
    private class NameIterator : Iterator {
        var index = 0
        
        func hasNext() -> Bool {
            if  index < names.count {
                return true
            }
            return false
        }
        
        func next() -> String? {
            if self.hasNext() {
                return names[index++]
            }
            return nil
        }
    }
}

let nameRepo = NameRepository()

let iter = nameRepo.getIterator()

let indx = 0

while iter.hasNext() {
    let name = iter.next()
    print("Name "+name!)
}