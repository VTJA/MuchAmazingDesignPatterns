//: Playground - noun: a place where people can play

import UIKit

class Employee {
    
     private let name: String
     private let dept: String
     private let salary: Int
     private var subordinates: [Employee]
    
    init(name: String, dept: String, salary: Int) {
        self.name = name
        self.dept = dept
        self.salary = salary
        self.subordinates = [Employee]()
    }
    
    func add(e: Employee) {
        subordinates.append(e)
    }
    
    func remove(e: Employee) {
        self.subordinates = subordinates.filter{$0 !== e}
    }
    
    func getSubordinates() -> [Employee] {
        return self.subordinates
    }
    
    func description() {
        return print("Employee: Name: \(name) dept: \(dept) salary: \(salary)")
    }
}

let CEO = Employee(name: "John", dept: "CEO", salary: 30000)

let headSales = Employee(name: "Robert", dept: "Head Sales", salary: 20000)

let headMarketing = Employee(name: "Michel", dept: "Head Marketing", salary: 20000)

let clerk1 = Employee(name: "Laura", dept: "Marketing", salary: 10000)
let clerk2 = Employee(name: "Bob", dept: "Marketing", salary: 10000)

let salesExecutive1 = Employee(name:"Richard", dept: "Sales", salary: 10000)
let salesExecutive2 = Employee(name: "Rob", dept: "Sales", salary: 10000)

CEO.add(headSales)
CEO.add(headMarketing)

headSales.add(salesExecutive1)
headSales.add(salesExecutive2)

headMarketing.add(clerk1)
headMarketing.add(clerk2)

CEO.description()
for headEmployee in CEO.getSubordinates() {
    headEmployee.description()
    for employee in headEmployee.getSubordinates() {
        employee.description()
    }
}