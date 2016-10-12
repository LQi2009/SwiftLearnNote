//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
// if
let a = 100

if a > 10 {
    
    print(a,"> 10")
}

if !(a > 100) && 100 > 10{
    
    print("a")
}

// if let 解包
var optionalName:String? = "john appleed"

optionalName = nil
var greeting = "hello"

if let name = optionalName {
    greeting = "hello \(name)"
} else {
    greeting = "name is nill"
}
greeting

// ****************************************
// 三目运算符

let b = a > 60 ?"及格": "不及格"

// ****************************************
// for in
let scores = [76,34,2,34,56,342]
var teamScore = 0

for score in scores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
teamScore

//在循环中可以用...来表示范围
var firestForLoop = 0

// ... 包含前后的闭区间
// ..<  前闭后开的区间
for i in 0...3 {
    firestForLoop += i
}
firestForLoop

//1. 遍历区间
for i in 0...10 {
    
    print("遍历区间",i)
}

for i in 0..<10 {
    
    print("遍历区间",i)
}

//2.忽略循环变量
let base = 3
let power = 10
var answer = 1

for _ in 1...power {
    answer *= base
}

print(answer)

//3.遍历数组
let names = ["q","w","e","r","t"]

for name in names {
    print(name)
}

//4.遍历字典

let numbers = ["a":"3","d":"d3","e":"e3"]

for (name,values) in numbers {
    print(name,values)
}

//5.遍历字符串

for cha in "hello".characters {
    print(cha)
}

// ****************************************
//switch语句 支持任意类型的数据及各种操作比较

let vegetavle = "red pepper"

switch vegetavle {
case "celery":
    let vagetableComment = "add some rains and meake ants on a log"
case "cucumber","watercress":
    let vagetableComment = "that would make"
case let x where x.hasSuffix("pepper"):
    let vagetableComment = "is it a spicy \(x)?"
    
    
default:
    let vagetableComment  = "every"
    
}

// ****************************************
//while 语句
var n = 2

while n < 100 {
    n = n * 2
    print("\(n)")
}

n


var m = 2

repeat {
    m = m*2
} while m < 100
m

//水仙花数字
var i = 100
var r = 0
var s = 0
var t = 0

while i < 1000 {
    r = i/1000
    s = (i - r*100)/10
    t = i - r*100 - s * 10
    
    if (i == r*r*r + s*s*s + t*t*t) {
        print("i == \(i)")
    }
    i += 1
}

// ****************************************
//断言
let age = 2

assert(age>0, "年龄必须大于0")

// ****************************************
//跳转语句 continue break fallthrough return

for con in 0 ..< 100 {
    if con % 10 == 0 {
        continue
    }
    print("continue \(con)");
}

for con in 0 ..< 10 {
    if con == 5 {
        break
    }
    print(con)
}
print("game over");

//fallthrough 主要用于switch语句,swift中的switch语句隐含了break功能,如果想要case1,和case2同时执行,就用到fallthrough

var k = "add"
let coun = 5
switch coun{
case 2,3,5,7,11,13,17,19:
    k += "case"
    fallthrough
default:
    k += "default"
}

print(k)

