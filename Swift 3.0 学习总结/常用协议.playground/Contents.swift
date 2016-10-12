//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
// Equatable 是否相等
// Comparable 是否可比较
// CustomStringConvertible 修改控制台输出
// BooleanType 可将对象视为一个bool值
struct Record: Equatable, Comparable, CustomStringConvertible {
    
    var wins: Int
    var losses: Int
    
    // CustomStringConvertible 只需重载下面的方法,修改为我们想要输出的字符串格式
    var description: String {
        
        return "WINS:" + String(wins) + ", LOSSES:" + String(losses)
    }
    
    // BooleanType 需要重载下面的属性
    var boolValue: Bool {
        
        return wins > losses
    }
}

func ==(left: Record, right: Record) -> Bool {
    
    return left.wins == right.wins
}

func <(left: Record, right: Record) -> Bool {
    
    if left.wins != right.wins {
        return left.wins < right.wins
    }
    
    return left.losses > right.losses
}

let recordA = Record(wins: 10, losses: 5)
let recordB = Record(wins: 10, losses: 5)

// 实现协议后,即使没有重载这个运算符,也能使用
recordA != recordB
recordA > recordB


var team1 = Record(wins: 10, losses: 3)
var team2 = Record(wins: 8, losses: 5)
var team3 = Record(wins: 8, losses: 8)
var records = [team1,team2,team3]

records.sort()

print(recordA)

//BooleanType 因为遵循了这个协议,所以可判断
//if recordA {
//    
//    print("great!")
//}

// 利用协议扩展非0即真
//extension Int: BooleanType {
//    
//    public var boolValue: Bool {
//        
//        return self != 0
//    }
//}

var wins = 0

//if !wins {
//    
//}

        
