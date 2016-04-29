//: Playground - noun: a place where people can play

import UIKit

class Game {
    
    func startPlay() {
        assert(false,"override required")
    }
    func endPlay() {
        assert(false,"override required")
    }
    func initialize() {
        assert(false,"override required")
    }
    func play() {
        startPlay()
        initialize()
        endPlay()
    }
}

class Footbal: Game {
    override func startPlay() {
        print("starts footbal game")
    }
    override func endPlay() {
        print("ends footbal game")
    }
    override func initialize() {
        print("initializing footbal game")
    }
}

class Basketball: Game {
    override func startPlay() {
        print("starts basketball game")
    }
    override func endPlay() {
        print("ends basketball game")
    }
    override func initialize() {
        print("initializing basketball game")
    }
}

var game : Game = Footbal()
game.play()

game = Basketball()
game.play()

