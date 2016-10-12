//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// 函数格式
// func 函数名(参数1:参数1类型,参数2:参数2类型...) -> 返回值类型 { 函数体 }

// 1. 无返回值,无参数函数
func sayHello() {
    
    print("Hello Boy !")
}
// 调用
sayHello()

// 2. 无返回值,有参数函数
func sayHello(to: String) {
    
    print("hello \(to) !")
}
sayHello(to: "Swift")

// 形参别名,前者暴漏外部, 后者内部使用
//外部形参(别名):调用函数接口时可见;
func sayHello1(to name: String) {
    
    print("Hello \(name)!")
}
sayHello1(to: "MySelf")

// 隐藏形参, 外部不暴漏形参
func sayHello(_ name: String) {
    
    print("Hello \(name)!")
}
sayHello("OC")

// 3. 有返回值,无参数
func reply() -> String {
    
    return "I'm fine,thanks!"
}

let rep = reply()

// 返回多个值,借助 元组
func replyYou() -> (String, Int) {
    
    return ("LQQ", 23)
}

let reYou = replyYou()
print("My name is \(reYou.0), and i'm \(reYou.1) years old")

// 4. 带返回值的函数  ->代表有返回值  其后为返回值类型
func sayHello2(name:String,day:String) ->String {
    
    return "hello \(name) and \(day)"
}
let say = sayHello2(name: "LQQ", day: "Tody")
print(say)


//函数形参可以设置默认值
func join(string s1: String,toString s2: String,withJoner joiner: String = "..") -> String {
    
    return s1 + joiner + s2
}

//没有赋值的情况下 使用默认值
join(string: "wo", toString: "ni")
join(string: "wo", toString: "ni", withJoner: "--")


//可变形参,类型后加...,相当于声明了一个数组类型
//计算不定数量的数字的平均值
func arithmenticMean(numbers: Double...)-> Double {
    
    var totle: Double = 0
    for number in numbers {
        totle += number
    }
    
    return totle/Double(numbers.count)
}

arithmenticMean(numbers: 23,34,33)
//一个函数最多只能带一个可变形参,而且最好放在参数列表的最末尾
//函数接口参数默认都是常量,如果想使用变量,只需要在声明的参数前用var修饰



//inout 类型参数,可以改变传递给函数的参数的值
//例如  交换两个数值
func swapTeoInts( a: inout Int, b: inout Int) {
    let temp = a
    a = b
    b = temp
    
}

var someInt = 3
var anotherInt = 9

//传进的参数必须是var变量,且前面加&
swapTeoInts(a: &someInt, b: &anotherInt)

//此时这两个数值 发生了变化
someInt
anotherInt


//函数当做返回值
func makeIncrementer() -> ((Int)->Int) {
    func addOne(number:Int)->Int {
        return 1 + number
    }
    
    return addOne
}

var increment = makeIncrementer()
increment(4)


//函数当做参数
func hasAnyMatches(list:[Int],condition:(Int) -> Bool)->Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    
    return false
}

func lessThanTen(number:Int) -> Bool {
    return number < 10
}

var numbers = [20,30,33,12,2,11]

hasAnyMatches(list: numbers, condition: lessThanTen)

// ************************************
// 闭包 ,格式同函数,只是没有名称

let digitNames = [0: "zero",1: "one",2: "two",3: "three",4: "four",5: "five",6: "six",7: "seven",8: "eight",9: "nine"]

let numbers = [16,58,510]

let strings = numbers.map { (var number) -> String in
    
    var output = ""
    while number > 0 {
        output = digitNames[number%10]! + output
        number /= 10
    }
    
    return output
}

numbers.map {( num) -> String in
    
    var  number = num
    var output = ""
    while number > 0 {
        output = digitNames[number%10]! + output
        number /= 10
    }
    
    return output
}


