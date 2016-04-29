//: Playground - noun: a place where people can play

import UIKit

protocol Order {
    func execute()
}

class Stock {
    private let name = "ABC"
    private let quantity = 10
    
    func buy() {
        print("Stock Name: \(name) Quantity: \(quantity) bought")
    }
    
    func sell() {
        print("Stock Name: \(name) Quantity: \(quantity) sold")
    }
}

class BuyStock: Order {
    private let abcStock: Stock
    
    init(abcStock: Stock) {
        self.abcStock = abcStock
    }
    
    func execute() {
        abcStock.buy()
    }
}

class SellStock: Order {
    private let abcStock: Stock
    
    init(abcStock: Stock) {
        self.abcStock = abcStock
    }
    
    func execute() {
        abcStock.sell()
    }
}

class Broker {
    var orderList = [Order]()
    
    func takeOrder(order: Order) {
        orderList.append(order)
    }
    
    func placeOrders() {
        for order in orderList {
            order.execute()
        }
        orderList.removeAll()
    }
}

let abcStock = Stock()

let buyStockOrder = BuyStock(abcStock: abcStock)
let sellStockOrder = SellStock(abcStock: abcStock)

let broker = Broker()

broker.takeOrder(buyStockOrder)
broker.takeOrder(sellStockOrder)

broker.placeOrders()