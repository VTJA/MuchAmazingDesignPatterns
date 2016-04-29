//: Playground - noun: a place where people can play

import UIKit

protocol Item {
    func name() -> String
    func packing() -> Packing
    func price() -> Float
}

protocol Packing {
    func pack() -> String
}

class Wrapper: Packing {
    func pack() -> String {
        return "Wrapper"
    }
}

class Bottle: Packing {
    func pack() -> String {
        return "Bottle"
    }
}

class Burger: Item {
    func packing() -> Packing {
        return Wrapper()
    }
    
    func name() -> String {
        assert(false, "method should be overriden")
    }
    
    func price() -> Float {
        assert(false, "method should be overriden")
    }
}

class ColdDrink: Item {
    func packing() -> Packing {
        return Bottle()
    }
    
    func name() -> String {
        assert(false, "method should be overriden")
    }
    
    func price() -> Float {
        assert(false, "method should be overriden")
    }
}

class VegBurger: Burger {
    override func name() -> String {
        return "Veg Burger"
    }
    
    override func price() -> Float {
        return 25.0
    }
    
}

class ChickenBurger: Burger {
    override func name() -> String {
        return "Chicken Burger"
    }
    
    override func price() -> Float {
        return 50.0
    }
}

class Pepsi: ColdDrink {
    override func price() -> Float {
        return 35.0
    }
    
    override func name() -> String {
        return "Pepsi"
    }
}

class Coke: ColdDrink {
    override func price() -> Float {
        return 45.0
    }
    
    override func name() -> String {
        return "Coke"
    }
}

class Meal {
    var items = [Item]()
    
    func addItem(item: Item) {
        items.append(item)
    }
    
    func getCost() -> Float {
        var cost: Float = 0.0
        
        for item in items {
            cost += item.price()
        }
        return cost
    }
    
    func showItems() {
        for item in items {
            print("------------")
            print("Item: "+item.name())
            print("Packing: "+item.packing().pack())
            print("Price: "+String(item.price()))
        }
        print("------------")
        print("Total : "+String(getCost()))
    }
}

class MealBuilder {
    func prepareVegMeal() -> Meal {
        let meal = Meal()
        meal.addItem(VegBurger())
        meal.addItem(Coke())
        return meal
    }
    
    func prepareNonVegMeal() -> Meal {
        let meal = Meal()
        meal.addItem(ChickenBurger())
        meal.addItem(Pepsi())
        return meal
    }
}

let builder = MealBuilder()

let vegMeal = builder.prepareVegMeal()

vegMeal.showItems()

let nonVegMeal = builder.prepareNonVegMeal()

nonVegMeal.showItems()


