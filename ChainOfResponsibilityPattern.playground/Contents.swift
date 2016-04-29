//: Playground - noun: a place where people can play

import UIKit

class AbstractLogger {
    static let INFO = 1
    static let DEBUG = 2
    static let ERROR = 3
    
    private var level: Int = 0
    
    private var nextLogger: AbstractLogger? = nil
    
    func setNextLogger(nextLogger: AbstractLogger) {
        self.nextLogger = nextLogger
    }
    
    func logMessage(level: Int, message: String){
        if self.level <= level {
            write(message)
        }
        if nextLogger != nil {
            nextLogger?.logMessage(level, message: message)
        }
    }
    
    func write(message: String) {
        assert(false, "override required")
    }
}

class ConsoleLogger: AbstractLogger {
    
    init(level : Int) {
        super.init()
        self.level = level
    }
    
    override func write(message: String) {
        print("Standard Console::Logger: \(message)")
    }
}

class ErrorLogger: AbstractLogger {
    
    init(level : Int) {
        super.init()
        self.level = level
    }
    
    override func write(message: String) {
        print("Error::Logger: \(message)")
    }
}

class FileLogger: AbstractLogger {
    
    init(level : Int) {
        super.init()
        self.level = level
    }
    
    override func write(message: String) {
        print("File::Logger: \(message)")
    }
}

func getChainOfLoggers() -> AbstractLogger {
    let errorLogger = ErrorLogger(level: AbstractLogger.ERROR)
    let fileLogger = FileLogger(level: AbstractLogger.DEBUG)
    let consoleLogger = ConsoleLogger(level: AbstractLogger.INFO)
    
    errorLogger.setNextLogger(fileLogger)
    fileLogger.setNextLogger(consoleLogger)
    
    return errorLogger
}


let loggerChain = getChainOfLoggers()

loggerChain.logMessage(AbstractLogger.INFO, message: "This is an information.")

loggerChain.logMessage(AbstractLogger.DEBUG, message: "This is an debug level information.")

loggerChain.logMessage(AbstractLogger.ERROR, message: "This is an error information.")
