//: Playground - noun: a place where people can play

import UIKit
//************ 泛型函数 ***************
var str = "Hello, playground"

// 交换两个整形数
func swapTwoInt( a: inout Int , _ b: inout Int) {
    (a,b) = (b,a)
}

var a: Int = 0
var b: Int = 6
swapTwoInt(a: &a, &b)
a
b

func swapTwoDouble( a: inout Double , _ b: inout Double) {
    (a,b) = (b,a)
}

// 泛型,逻辑和类型无关
func swapTwoThings<T>( a: inout T, _ b: inout T) {
    
    (a,b) = (b,a)
}


var hello = "Hello"
var bye = "bye"

swapTwoThings(a: &hello, &bye)
hello
bye


//************ 泛型类型 ***************
// < >就是用到了泛型
let arr: Array<Int> = Array<Int>()
let dict = Dictionary<String,Int>()
let set = Set<Float>()


// 泛型类型,在具体初始化的时候传入实际类型
struct Stack<T> {
    var items = [T]()
    
    func isEmpty() -> Bool {
        
        return items.count == 0
    }
    // 结构体的方法修改了结构体的内容时,需要使用关键字mutating修饰
    mutating func push(item: T){
        items.append(item)
    }
    
    mutating func pop() -> T? {
        
        guard !self.isEmpty() else {
            return nil
        }
        
        return items.removeLast()
    }
}



var  s = Stack<Int>()
s.push(item: 1)
s.push(item: 2)
s.pop()


// 扩展
extension Stack {
    func top() -> T? {
        return items.last
    }
}

var ss = Stack<String>()
ss.top()


// 多个泛型类型,逗号隔开
struct Pair<T1, T2> {
    var a: T1
    var b: T2
    
    
}

var pair = Pair<Int, String>(a: 0, b: "hello")




//// 泛型
//非泛型函数
func swapTwoInts( a: inout Int, b: inout Int) {
    let temp = a
    a = b
    b = temp
}


var someInt1 = 3
var anotherInt = 12

swapTwoInts(a: &someInt1, b: &anotherInt)

someInt1
anotherInt

func swapTwoStrings( a: inout String, b: inout String) {
    let temp = a
    a = b
    b = temp
    
}

func swqpTwoDoubles( a: inout Double, b: inout Double)  {
    let temp = a
    a = b
    b = temp
}

//以上三个函数  可以定义一个泛型函数
func swapTwoValues<T>( a: inout T, b: inout T) {
    
    let temp = a
    a = b
    b = temp
}
//占位类型 T 可自定义,一般大写开头,驼峰命名

//模拟栈操作
//非泛型函数
struct IntStack {
    
    var items = [Int]()
    mutating func push(item: Int){
        items.append(item)
    }
    
    mutating func pop(item: Int) -> Int{
        return items.removeLast()
    }
}

// 上面只能处理int型数据

// 泛型函数
struct Stack1<T> {
    var items = [T]()
    mutating func push(item: T) {
        
        items.append(item)
    }
    
    mutating func pop() -> T {
        
        return items.removeLast()
    }
}


//泛型函数中的类型约束
//<类型占位符: 约束类型>

func findIndex<T: Equatable>(a: T)  {
    
}

