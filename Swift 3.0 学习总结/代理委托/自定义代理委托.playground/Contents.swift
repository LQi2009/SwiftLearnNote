//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

protocol TurnBaseGame {
    var turn: Int {get set}
    
    func play()
}

// 可选协议方法: 不需要一定实现的方法
// 包含可选方法的代理需要使用 @objc 关键字修饰
@objc protocol TurnBaseGameDelegate {
    
    func gameStart()
    func playerMove()
    func gameEnd()
    
    @objc optional func turnStart()
    @objc optional func turnEnd()
    
    func gameOver() -> Bool
}
// 这是需要调用可选方法时需要进行的操作
// 将 SinglePlayerTurnBaseGame 改为oc的类
class SinglePlayerTurnBaseGame: NSObject ,TurnBaseGame {
    
    var turn: Int = 0
    
    var delegate: TurnBaseGameDelegate!
    
    func play() {
        
        delegate.gameStart()
        
        while !delegate.gameOver() {
            
            // 调用可选的方法
            if let turnStart = delegate.turnStart {
                turnStart()
            }
            
            print("ROUND",turn,":")
            delegate.playerMove()
            
            // 可选方法另一种调用方法
            delegate.turnEnd?()
            
            turn += 1
        }
        
        delegate.gameEnd()
    }
}

// 能够遵循含有可选方法的代理必须是类,而且是OC语言的类
// 需要这个类继承自oc语言的类或者其子类
// 这里继承自 SinglePlayerTurnBaseGame ,不能多继承
// 所以可以把 SinglePlayerTurnBaseGame 改为继承自oc的类
class RollNumberGame: SinglePlayerTurnBaseGame, TurnBaseGameDelegate {
    
    var score = 0
    
    override init() {
        
        super.init()
        delegate = self
    }
    
    func gameStart() {
        score = 0
        turn = 0
        
        print("welcome")
    }
    
    func gameOver() -> Bool {
        
        return score >= 100
    }
    func playerMove() {
        
        let rollNumber = Int(arc4random()) % 6 + 1
        
        score += rollNumber
        
        print("you rolled a",rollNumber)
        
    }
    
    func gameEnd() {
        print("end")
    }
    
}

let rollNumberGame = RollNumberGame()
rollNumberGame.play()


class RockPaperScissors: SinglePlayerTurnBaseGame,TurnBaseGameDelegate {
    
    enum Shape: Int{
        case Rock
        case Scissors
        case Papper
        
        func beat(shape: Shape) -> Bool {
            
            return (self.rawValue + 1)%3 == shape.rawValue
        }
    }
    
    var wins = 0
    
    override init() {
        super.init()
        
        delegate = self
    }
    
    static func go() -> Shape {
        
        return Shape(rawValue: Int(arc4random())%3)!
    }
    
    func show(hand: Shape) -> String {
        switch hand {
        case .Papper:
            return "Paper"
        case .Rock:
            return "Rock"
        case .Scissors:
            return "Scissors"
        }
    }
    
    func gameStart() {
        
        wins = 0
        print("Start")
    }
    
    func gameOver() -> Bool {
        
        return turn >= 3
    }
    
    func gameEnd() {
        if wins >= 2 {
            print("you win")
        }
        else {
            print("you lose...")
        }
    }
    
    func playerMove() {
        
        let yourShape = RockPaperScissors.go()
        let otherShape = RockPaperScissors.go()
        
        if yourShape.beat(shape: otherShape) {
            print("you win this round")
            wins += 1
        } else {
            print("you didnt  win")
        }
        
    }
    
    func turnStart() {
        print("== ROUND START ==")
    }
    
    func turnEnd() {
        print("===========")
    }
}

let rock = RockPaperScissors()
rock.play()

        
