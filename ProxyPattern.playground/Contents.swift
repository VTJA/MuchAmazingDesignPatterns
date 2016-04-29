//: Playground - noun: a place where people can play

import UIKit

protocol Image {
    func display()
}

class RealImage: Image {
    let fileName: String
    
    init(fileName: String) {
        self.fileName = fileName
        loadFromDisk(fileName)
    }
    
    func display() {
        print("displaying \(fileName)")
    }
    
    func loadFromDisk(fileName: String) {
        print("Loading \(fileName)")
    }
}

class ProxyImage: Image {
    
    private var realImage: RealImage? = nil
    private let fileName: String
    
    init(fileName: String) {
        self.fileName = fileName
    }
    
    func display() {
        if let realImage = self.realImage {
            realImage.display()
        } else {
            self.realImage = RealImage(fileName: fileName)
            realImage?.display()
        }
    }
}

let image = ProxyImage(fileName: "test_img.jpg")

image.display()

image.display()

