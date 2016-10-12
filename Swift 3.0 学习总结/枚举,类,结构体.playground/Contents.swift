//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//枚举
enum CompassPoint {
    case North
    case South
    case East
    case West
}


enum Planet {
    case Mercury,Venus,Earth,Mars,Jupiter,Saturn,uranus,Nepturn
}



var directionToHead = CompassPoint.West
directionToHead = .East

switch directionToHead {
case .North:
    print("north")
case .South:
    print("south")
case .East:
    print("east")
case .West:
    print("west")
}

enum Planet1:Int {
    case Mercury = 1,Venus,Earth,Mars,Jupiter,Saturn,uranus,Nepturn
}

let earthsOrder = Planet1.Earth.rawValue
let possiblePlanrt = Planet1.init(rawValue: 7)


//类和结构体
struct Resolution {
    var width = 0
    var height = 0
    
}

class ViewoModel {
    var resolution = Resolution()
    var frameRate = 0.0
    var interlaced = false
    var name:String?
    
}

//类和结构体的初始化
let someResolition = Resolution()
let someVideo = ViewoModel()


let res = someResolition.width
let mod = someVideo.resolution.width

//结构体初始化属性
let vga = Resolution(width: 640,height: 480)

//结构体和枚举都是值拷贝

let hd = Resolution(width: 1920,height: 1080)

var cinema = hd
//这里的hd和cinema不是同一个实例,cinema是hd的一个copy,如果改变了cinema的值,hd的值是不会发生变化的
cinema.width = 2048

cinema.width//其值发生了变化
hd.width//其值未变化

//枚举也遵循相同的原则
let current = CompassPoint.West
var remember = current
remember = .East

remember
current

//类是引用类型
let tenEight = ViewoModel()
tenEight.resolution = hd
tenEight.interlaced = true
tenEight.name = "1080i"
tenEight.frameRate = 25

let  alsoTenEight = tenEight
alsoTenEight.frameRate = 30.0


//因为类是引用类型的,所以这里的tenEight的值也发生了变化
tenEight.frameRate
alsoTenEight.frameRate
//只是同一实例的两种名称

//恒等运算符 ===   ,用于判断两个常量或者变量是否引用同一个实例
if (alsoTenEight === tenEight) {
    print("===")
}

//同样 !== 不等价于


//属性的延迟加载

class DataImporter {
    
    var fileName = "data.text"
    
}


class DataManager {
    
    lazy var importer = DataImporter()
    
    var data = [String]()
}

let manager = DataManager()
manager.data.append("some data")
manager.data.append("some more data")
//这时importer属性并没有被创建,当访问的时候才会创建
manager.importer.fileName


//计算属性
//类.结构体和枚举可以定义计算属性,计算属性不直接存储值,而是提供一个getter来取值

struct Point {
    var x = 0.0,y = 0.0
    
}

struct Size {
    var width = 0.0,height = 0.0
    
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        
        get {
            let centerX = origin.x + (size.width/2)
            let ceterY = origin.y + (size.height/2)
            
            return Point(x: centerX,y: ceterY)
        }
        
        set (newCenter) {
            origin.x = newCenter.x - (size.width/2)
            origin.y = newCenter.y - (size.height/2)
        }
    }
}

var square = Rect(origin: Point(x: 0.0,y: 0.0),size: Size(width: 10.0,height: 10.0))

let initialSquareCenter = square.center
square.center = Point(x: 15.0,y: 15.0)

print("square:(\(square.origin.x),\(square.origin.y))")

//属性监视willSet,didSet,,,,
class StepCount {
    
    var totalSteps: Int = 0  {
        
        willSet (newTotalSteps) {
            
            print("to\(newTotalSteps)")
        }
        
        didSet {
            if totalSteps > oldValue {
                print ("\(totalSteps - oldValue)")
            }
        }
    }
    
}

let step = StepCount()
step.totalSteps = 300

step.totalSteps

step.totalSteps = 400



//类型属性
//static 来定义值类型的类型属性,class类为类定义类型属性
struct SomeStruckture {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
        
        return 30
    }
}

enum SomeEnumeration {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
        
        return 30
    }
}

class SomeClass {
    class var computedTypeProperty: Int {
        return 33
    }
    
}

//类型属性的访问也是通过点运算符来进行的,只不过类型属性是通过类型本身来获取和设置,而不是通过实例

SomeStruckture.storedTypeProperty
SomeStruckture.computedTypeProperty

SomeEnumeration.storedTypeProperty
SomeEnumeration.computedTypeProperty

SomeClass.computedTypeProperty


//方法
//实例方法

class Counter {
    var count = 0
    
    func increment() {
        count += 1
    }
    
    func incrementBy(amount: Int) {
        count += amount
    }
    
    func reset() {
        count = 0
    }
}

let counter = Counter()

counter.increment()
counter.count
counter.incrementBy(amount: 5)
counter.count
counter.reset()
counter.count

//实例方法修改值类型----变异方法
struct Point1 {
    var x = 0.0,y = 0.0
    mutating func moveByX(deltaX: Double,y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}


var somepoint = Point1(x: 1.0, y: 1.0)
somepoint.moveByX(deltaX: 2.0, y: 3.0)
somepoint.x
somepoint.y



//变异方法修改self

struct Point2 {
    var x = 0.0,y = 0.0
    mutating func moveByX(deltaX: Double, y deltaY: Double) {
        self = Point2(x: x + deltaX,y: y + deltaY)
    }
}
//和上面的方法效果类似


//枚举的变异方法可以把self设置为相同的枚举类型中不同的成员
enum TriStateSwitch {
    case Off,Low,High
    mutating func next() {
        switch self {
        case .Off:
            self = .Low
        case .Low:
            self = .High
        case .High:
            self = .Off
            
        }
    }
}


//类型方法(OC中的类方法)
//声明类的类型方法,在方法func之前加上关键字class;声明结构体和枚举的类型方法,在方法func之前加上关键字static
class Someclass {
    class func sometypemethod() {
        
        print("some")
    }
}

Someclass.sometypemethod()


//附属脚本
//subscript(index: Int) -> Int {
//    get {
//        
//        return 20
//    }
//    
//    set(newValue) {
//        
//    }
//}

struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        
        return multiplier * index
    }
}

let threeTimes = TimesTable(multiplier: 3)
print("3 的 6 倍是\(threeTimes[6])")


struct Matrix {
    let rows: Int,columns: Int
    
    
}


        
