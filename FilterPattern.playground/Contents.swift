//: Playground - noun: a place where people can play

import UIKit

class Person {
    
    private let name: String
    private let gender: String
    private let maritalStatus: String
    
    init(name: String, gender: String, maritalStatus: String) {
        self.name = name
        self.gender = gender
        self.maritalStatus = maritalStatus
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getGender() -> String {
        return self.gender
    }
    
    func getMaritalStatus() -> String {
        return self.maritalStatus
    }
}

protocol Criteria {
    func meetCriteria(persons: [Person]) -> [Person]
}

class CriteriaMale: Criteria {
    func meetCriteria(persons: [Person]) -> [Person] {
        var malePersons = [Person]()
        for person in persons {
            if person.getGender() == "Male" {
                malePersons.append(person)
            }
        }
        return malePersons
    }
}

class CriteriaFemale: Criteria {
    func meetCriteria(persons: [Person]) -> [Person] {
        var femalePersons = [Person]()
        for person in persons {
            if person.getGender() == "Female" {
                femalePersons.append(person)
            }
        }
        return femalePersons
    }
}

class CriteriaSingle: Criteria {
    func meetCriteria(persons: [Person]) -> [Person] {
        var singlePersons = [Person]()
        for person in persons {
            if person.getMaritalStatus() == "Single" {
                singlePersons.append(person)
            }
        }
        return singlePersons
    }
}

class AndCriteria: Criteria {
    
    private let criteria: Criteria
    private let otherCriteria: Criteria
    
    init(criteria: Criteria, otherCriteria: Criteria){
       self.criteria = criteria
        self.otherCriteria = otherCriteria
    }
    
    func meetCriteria(persons: [Person]) -> [Person] {
        let firstCriteriaPersons = criteria.meetCriteria(persons)
        return otherCriteria.meetCriteria(firstCriteriaPersons)
    }
}

class OrCriteria: Criteria {
    private let criteria: Criteria
    private let otherCriteria: Criteria
    
    init(criteria: Criteria, otherCriteria: Criteria){
        self.criteria = criteria
        self.otherCriteria = otherCriteria
    }
    
    func meetCriteria(persons: [Person]) -> [Person] {
        var firstCriteriaItems = criteria.meetCriteria(persons)
        let otherCriteriaItems = otherCriteria.meetCriteria(persons)
        
        for person in otherCriteriaItems {
            if firstCriteriaItems.contains({ (Person) -> Bool in
                return false
            }) {
               firstCriteriaItems.append(person)
            }
        }
        return firstCriteriaItems
    }
}

var persons = [Person]()

persons.append(Person(name: "Bob", gender: "Male", maritalStatus: "Married"))

persons.append(Person(name: "Ann", gender: "Female", maritalStatus: "Married"))

persons.append(Person(name: "Alex", gender: "Male", maritalStatus: "Single"))

persons.append(Person(name: "Veronica", gender: "Female", maritalStatus: "Married"))

persons.append(Person(name: "Pewdiepie", gender: "Male", maritalStatus: "Single"))

let male = CriteriaMale()

let female = CriteriaFemale()

let single = CriteriaSingle()

let singleMale = AndCriteria(criteria: single, otherCriteria: male)

let singleOrFemale = OrCriteria(criteria: single, otherCriteria: female)

let singleAndFemale = AndCriteria(criteria: single, otherCriteria: female)

//male.meetCriteria(persons)
//
//singleMale.meetCriteria(persons)

singleOrFemale.meetCriteria(persons)

//singleAndFemale.meetCriteria(persons)

