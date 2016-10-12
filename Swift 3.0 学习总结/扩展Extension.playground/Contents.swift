//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//扩展 extension
// 扩展属性,只能是计算属性
extension Double {
    var km: Double {
        return self*1_000.0
    }
    
    var m: Double {
        return self
    }
    
    var cm: Double {
        return self/100.0
    }
    var mm: Double {
        return self/1_000.0
    }
    var ft: Double {
        return self/3.28084
    }
}

let oneInch = 25.4.mm
let threeFeet = 3.ft


//扩展方法
extension Int {
    
    func repetitions(task: () ->()) {
        for  _ in 0..<self {
            task()
        }
    }
}

3.repetitions {
    print("aaaa")
}

//修改实例方法
//结构体和枚举类型中修改self或其属性的方法必须将该实例方法标注为mutating
extension Int {
    
    mutating func square() {
        
        self = self*self
    }
}

var someInt = 3

someInt.square()

//下标
extension Int {
    
    subscript (digitIndex: Int) -> Int {
        
        var decimalBase = 1
        
        for _ in 1...digitIndex {
            
            decimalBase *= 10
        }
        
        return (self/decimalBase) % 10
    }
}

43564[1]

// 扩展自定义类
struct Point {
    var x = 0.0
    var y = 0.0
}

struct Size {
    var width = 0.0
    var height = 0.0
}

class Rectangle {
    var origin = Point()
    var size = Size()
    
    
    init(origin: Point , size: Size) {
        
        self.origin = origin
        self.size = size
    }
}

// 扩展
extension Rectangle {
    func translate(x: Double, y: Double) {
        self.origin.x += x
        self.origin.y += y
    }
}

let rect = Rectangle(origin:Point() ,size: Size(width:  4, height: 3))
rect.translate(x: 10, y: 10)

rect

// 属性的扩展只能扩展计算型属性,
// 存储型属性不能扩展,但是可以在扩展中修改
extension Rectangle {
    
    var center: Point {
        
        get {
            let centerX = origin.x + size.width/2.0
            let centerY = origin.y + size.height/2.0
            
            return Point(x: centerX, y: centerY)
        }
        
        set(newCenter) {
            origin.x = newCenter.x - size.width/2.0
            origin.y = newCenter.y - size.height/2.0
        }
    }
    
    // 扩展初始化函数只能是便利构造函数
    convenience init(center: Point, size: Size) {
        
        let originX = center.x - size.width/2
        let originY = center.y - size.height/2
        
        self.init(origin: Point(x: originX, y: originY),size: size)
        
    }
}

// 嵌套类型
extension Rectangle {
    
    enum Vertex: Int {
        case LeftTop
        case RightTop
        case RightBottom
        case LeftBottom
    }
    
    func pointAtVertex(v: Vertex) -> Point {
        switch v {
        case .LeftTop:
            return origin
        case .RightTop:
            return Point(x: origin.x + size.width, y: origin.y)
        case .RightBottom:
            return Point(x: origin.x + size.width,y: origin.y + size.height)
        case .LeftBottom:
            return Point(x: origin.x , y: origin.y + size.height)
        }
    }
    
    // 扩展下标
    subscript(index: Int) -> Point {
        
        assert(index >= 0 && index < 4, "Index in rectangle out of range")
        
        return pointAtVertex(v: Vertex(rawValue: index)!)
    }
}

let rect1 = Rectangle(origin: Point(),size: Size(width: 3, height: 4))

rect1.pointAtVertex(v: .RightBottom)
rect1.pointAtVertex(v: Rectangle.Vertex.RightBottom)


rect1[2]

