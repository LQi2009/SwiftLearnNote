//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// 协议
// 协议可以被类遵循,也可以被结构体遵循
// 声明协议
protocol Peting {
    
    //声明属性,不能有默认值
    var name: String {get set}
    //只读
    var birthPlace: String {get}
    //协议中的属性只能是var,不能是let
    
    // 方法: 只声明,不实现
    func playWith()
    func fed(food: String)
    
    // 如果方法中要改变自身的属性,需要用mutating关键字修饰
    mutating func changeName(newName: String)
}

// 声明一个只能被类遵循的协议
protocol Pet1: class {
    
}

//使用协议
struct Cat: Peting {
    
//        private var myDoggyName: String
//        var name: String {
//    
//            get {
//    
//                return myDoggyName
//            }
//            set {
//    
//                myDoggyName = newValue
//            }
//        }
    // 实现协议中定义的属性时,可以赋初始值
    var name: String = ""
    let birthPlace: String = "beijing"
    
    func playWith() {
        print("wong!")
    }
    
    // 方法的参数在实现时也可以赋初始值
    func fed(food: String = "Bone") {
        if food == "Bone" {
            print("Happy")
        } else {
            print("I want a bone")
        }
    }
    
    mutating func changeName(newName: String) {
        name = newName
    }
}

let myCat: Cat = Cat()

let aPet: Peting = myCat

// 协议 与 构造函数
// 当协议中有构造方法(init)时
protocol Pet {
    var name: String {get set}
    
    // 协议中有init初始化方法时,遵循协议的类中的初始化方法需要使用required关键字修饰
    init(name: String)
    
    func playWith()
    func fed()
}

class Animal {
    
    var type: String = "mammal"
}

// 如果一个类既继承自其它类,又遵循某协议,父类写在最前面
class Dog:  Animal, Pet {
    var name: String = "Puppy"
    // required 子类必须实现的
    required init(name: String) {
        self.name = name
    }
    
    func playWith() {
        print("wong")
    }
    
    func fed() {
        print("I love bones")
    }
}

// final  不能被其它类继承
final class Dog1:  Animal, Pet {
    var name: String = "Puppy"
    // required 子类必须实现的
    init(name: String) {
        self.name = name
    }
    
    func playWith() {
        print("wong")
    }
    
    func fed() {
        print("I love bones")
    }
}

class Bird: Animal {
    var name: String = "little little bird"
    
    init(name: String) {
        
        self.name = name
    }
}

class Parrot: Bird {
    override init(name: String) {
        super.init(name: name + " " + name )
    }
}

// 如果父类的初始化函数是required类型的,子类重写时,不需要使用override
class Bird1: Animal {
    var name: String = "little little bird"
    
    required init(name: String) {
        
        self.name = name
    }
}

class Parrot1: Bird1 {
    required init(name: String) {
        super.init(name: name + " " + name )
    }
}

// *********************************************
// 协议的扩展
protocol Record: CustomStringConvertible {
    
    var wins: Int {get}
    var losses: Int {get}
    
    func winningPercent() -> Double
    
}

// CustomStringConvertible 协议需要自定义打印输出,如果格式一致,可使用扩展,来统一输出格式
extension Record {
    
    var description: String {
        
        return String(format: "WINS : %d , LOSSES: %d", arguments: [wins,losses])
    }
    
    // 在协议的扩展中可以添加新的方法,并添加具体的逻辑,这个方法,在遵循该协议的类中不是必须实现的
    func shoutWins() {
        
        print("WE WIN", wins ,"TIMES")
    }
    
    var gamePlayed: Int {
        
        return wins + losses
    }
}


protocol Tieable {
    
    var ties: Int {get set}
}

// 只对遵循了Tieable协议的Record进行扩展
extension Record where Self: Tieable {
    
    var gamePlayed: Int {
        
        return wins + losses + ties
    }
}

struct BasketBallRecord: Record {
    
    var wins: Int
    var losses: Int
    
    func winningPercent() -> Double {
        
        return Double(wins)/Double(wins + losses)
    }
}

struct BaseBallRecord: Record {
    
    var wins: Int
    var losses: Int
    let gamePlayed: Int = 162
    
    
    func winningPercent() -> Double {
        
        return Double(wins)/Double(wins + losses)
    }
}

struct FootballRecord: Record {
    
    var wins: Int
    var losses: Int
    let ties: Int
    
    var gamePlayed: Int {
        
        return wins + losses + ties
    }
    
    
    func winningPercent() -> Double {
        
        return Double(wins)/Double(wins + losses + ties)
    }
}

let teamRecord = BasketBallRecord(wins: 2, losses: 10)

print(teamRecord)
teamRecord.shoutWins()


// 扩展系统协议
extension CustomStringConvertible {
    
    var descriptionWithDate: String {
        
        return NSDate().description + " " + description
    }
}

print(teamRecord.descriptionWithDate)


let footBallTeamRecord = FootballRecord(wins: 1,losses: 1,ties: 1)
footBallTeamRecord.descriptionWithDate

// ***************************
// ********* 协议的别名 ******************

protocol WeightCalcuable {
    
    //associatedtype 在协议中使用  作用同typealias
    // 在遵循该协议的类中设置具体类型
    associatedtype WeightType
    var weight: WeightType {get}
}

class iPhone7: WeightCalcuable {
    
    typealias WeightType = Double
    
    var weight: WeightType {
        
        return 0.114
    }
    
    //    init(weight: Double) {
    //        self.weight = weight
    //    }
    
}

class Ship: WeightCalcuable {
    typealias WeightType = Int
    var weight: WeightType
    
    init(weight: Int) {
        self.weight = weight
    }
    
}

