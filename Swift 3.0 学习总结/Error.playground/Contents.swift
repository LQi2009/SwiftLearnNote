//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//assert 只在debug模式下有效,在release环境下无效
// 出错会立即停止
assert(1>0)

// 出错会立即终止,并在控制台输出后面的错误信息
assert(1>0, "出错了")

//没有条件,执行到这来就报错
//assertionFailure("没有条件,执行到这来就报错")

// 当条件不成立时, 抛出异常
precondition(1>0)


// 当条件不成立时, 抛出异常, 并打印错误信息
precondition(1>0, "some error")


// 无条件报错
//fatalError("error")







class Guess {
    
    var count = 4
    enum MyError: Error, CustomStringConvertible {
        
        case big(Int)
        case small
        
        var description: String {
            
            switch self {
            case .big(let num):
                
                return "too big \(num)"
                
            case .small:
                return "too small"
            }
        }
    }
    
    func enterNumber(_ num: Int) throws -> Bool {
        
        if num < count {
            throw MyError.small
            //return false
        } else if num > count {
            throw MyError.big(num)
            //return false
        } else if num == count {
            
            return true
        }
        return false
    }
}


let gus = Guess()

if let result = try? gus.enterNumber(4) {
    
    // 正常的处理逻辑
} else {
    
    // 抛出异常的处理逻辑
}

do {
    let result = try gus.enterNumber(3)
    
    print(result)
} catch Guess.MyError.small{
    // 处理异常
} catch Guess.MyError.big(let num) {
    // 处理异常
    print(num)
} catch {
    // 处理其他异常
}


do {
    let result = try gus.enterNumber(3)
    
    print(result)
} catch let error as Guess.MyError {
    
    print(error)
} catch {
    
    print("other error")
}
	 	