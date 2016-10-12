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

precondition(1>0)
precondition(1>0, "error")

//fatalError("error")