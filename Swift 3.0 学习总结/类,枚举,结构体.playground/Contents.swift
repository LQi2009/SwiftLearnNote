//: Playground - noun: a place where people can play

import UIKit


// 对象 和 类

class Shape {
    var numberOfSides = 0
    
    let shapeType = "AAAAA"
    
    func shapeType(name:String)-> String {
        return "shape == \(name) and \(shapeType)"
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides"
    }
}

var shape = Shape()
shape.numberOfSides = 5
shape.numberOfSides
shape.simpleDescription()
shape.shapeType

class NamedShape {
    var numberOfSides = 0
    var name:String
    
    init(name:String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "a shape with \(numberOfSides) sides"
    }
    
    deinit {
        print("deinit")
    }
}

var nameShapr = NamedShape.init(name: "zhangsan")

class Square: NamedShape {
    var sideLebgth:Double
    
    init (sideLength:Double,name:String){
        self.sideLebgth = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLebgth*sideLebgth
    }
    
    override func simpleDescription() -> String {
        return "a square with of length \(sideLebgth)"
    }
}

let test = Square(sideLength: 5.4,name: "my test ")
test.area()
test.simpleDescription()
test.numberOfSides

class Cicle: NamedShape {
    var redius:Double
    
    init(name: String ,redius:Double) {
        self.redius = redius
        super.init(name: name)
    }
    
    func areaCicle() -> Double {
        return redius*redius*M_PI
    }
    
    override func simpleDescription() -> String {
        return "the cicle's redius is \(redius)"
    }
    
}

var  cicle = Cicle(name: "yuan",redius: 12)
cicle.areaCicle()


//get set 
class EquilateralTriangle:NamedShape {
    var sideLength:Double = 0.0
    
    init(name: String,sideLength:Double) {
        self.sideLength = sideLength
        super.init(name: name)
        
        numberOfSides = 3
    }
    
    var perimeter:Double {
        get {
            return 3.0*sideLength
        }
        
        set {
            sideLength = newValue/3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "an equilateral triagle length \(sideLength)"
    }
    
}

var triangle = EquilateralTriangle(name: "a triangle",sideLength: 3.0)

triangle.perimeter
triangle.perimeter = 12
triangle.sideLength

class Counter {
    var count:Int = 0
    func incrementBy(amount:Int,numberOfTimers times:Int) {
        count += amount * times
    }
    
}

var counter = Counter()
counter.incrementBy(amount: 2, numberOfTimers: 7)
counter.count

let optionalSquare:Square? = Square(sideLength: 2.5,name: "optional")

let sidelength = optionalSquare?.name

// 枚举和结构体
enum Rank:Int {
    case Ace = 1
    case Two,Three,Four,Five,Six,Seven,Eight,Nine,Ten
    case Jack,Queen,King
    
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return "结束"
        }
    }
}

let ace = Rank.Ace
let aceRawValue = ace.rawValue

enum Suit {
    case Spades,Hearts,Diamonds,Clubs
    
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearth"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
            
//        default:
//            return "over"//枚举种类列举完后,就不需要default了
        }
    }
    
    func color() -> String {
        switch self {
        case .Spades,.Clubs:
            return "black"
        case .Hearts,.Diamonds:
            return "red"
        
        }
    }
}

let hearts = Suit.Hearts
let heartsDes = hearts.simpleDescription()

let clibs = Suit.Clubs
let clubsDes = clibs.color()

//结构体
struct Card {
    var rank:Rank
    var suit:Suit
    
    func simpleDescription() -> String {
        return "the \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}

let threeOfSpades = Card(rank: .Three,suit: .Spades)
let threeOfSpadesDes = threeOfSpades.simpleDescription()



enum ServerResponse {
    case Result(String,String)
    case Error(String)
}

let success = ServerResponse.Result("6:00 am", "8:09 pm")
let failure = ServerResponse.Error("out of cheese")

switch success {
case let .Result(sunrise,sunset):
    let serverResponse = "sunrise is at \(sunrise) and sunset is at \(sunset)"
    
case let .Error(error):
    let serverResponse = "failure...\(error)"
    
}

//接口和扩展
protocol ExampleProtocol {
    var simpleDescription:String {
        get
    }
    
    mutating func adjust()
    
}

//类  枚举 结构体实现接口
class simpleClass:ExampleProtocol {
    var simpleDescription: String = "a very simple class"
    var anotherProperty:Int = 897
    
    func adjust() {
        simpleDescription += "now 100% adjusted"
    }
}

var a = simpleClass()
a.adjust()
let aDes = a.simpleDescription


struct SimpleStructure : ExampleProtocol {
    var simpleDescription:String = "a simple struckture "
    mutating func adjust() {
        simpleDescription += "(adjusted)"
    }
    
}

var b = SimpleStructure()
b.adjust()
let bDes = b.simpleDescription



let string1 = "who are you"
let unkonw = 66
let string2 = string1 + String(unkonw)






