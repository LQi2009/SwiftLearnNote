//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// ****************************************
// 元组
//元组  将多个值合为单个值.元组内的值可以是任意类型,个元素不必是相同的类型.
//定义方法1
let http404 = (404,"not found")
//使用
print("code = \(http404.0)")
print("== \(http404.1)")

//定义方法2
let http502 = (statusCode:502,desc:"服务器错误")
print("code == \(http502.statusCode)")
print("desc == \(http502.desc)")


let http404Error = (404,"Not Found")

let (statusCode,statusMessage) = http404Error;

statusCode
statusMessage

// ****************************************
// 数组
// 定义
var arr: Array = ["aa","bb","ccc","dd","ee"]
var shoppingList = ["catfish","water","tulips","blue paint"]
//声明数组 ,并指定存储类型
var shoppingList1: [String] = ["apple","eggs"]

// 创建空数组,空数组需要显示指明元素类型
var emptyArr: Array<String> = []
var emptyArr1 = [String]()
var emptyArr2 = Array<String>()
var emptyArr3: [String] = []

//指定容量和初始值
var threeDouble = [Double](repeating: 0.0, count: 3)
var anotherThree = Array(repeating: 2.0, count: 3)
var anyArr = ["a",3] as [Any]

// 查
arr[0]

// 删
//删除一个元素,返回的是被删除的元素
arr.remove(at: 1)
arr.removeLast()
arr.removeFirst()

let dele = arr.remove(at: 0)// 会返回删除的值
arr.removeAll()

// 直接将数组赋值空数组也能全部删除
arr = []

// 增
arr += ["cc"]
arr.append("dd")

arr += shoppingList
arr.append(contentsOf: shoppingList1)

//批量替换
arr[2...3] = ["aaa","bbbb"]

shoppingList.insert("first", at: 0)
// 改
arr[0] = "cc"

// 遍历
for item in shoppingList {
    print(item)
}

//枚举遍历
for (index,value) in shoppingList.enumerated() {
    print("\(index)==\(value)")
}

//数组的拷贝
//数组的拷贝相对复杂一些,如果你将一个数组实例赋给一个变量或者常量,或者将其作为参数传递给函数或方法,就会发生拷贝行为

var copyArr = [1,2,3,4,5,6,7,8,9]
var copy1 = copyArr
var copy2 = copyArr

copyArr[0]
copy1[0]
copy2[0]

//当使用下边修改某一值时,其他两个相应的数值不会改名,发生拷贝行为
copyArr[0] = 100
//这时 copy1,copy2的第一个元素不变
copy1[0]

// 判断数组是否相等
if copy1 == copy2 {
    
    print("=====数组相等=======")
}

// ****************************************
// 字典
// 声明
var dic: Dictionary<String, String> = ["aa": "11","bb":"22"]

// 创建空字典
var emptyDic = Dictionary<String,Int>()
var emptyDic1: Dictionary<String,Int> = [:]
var emptyDic2 = [String:Int]()


// 删
let deleDic = dic.removeValue(forKey: "aa")// 会返回已删除的值
dic.removeAll()

// 增
dic["新键"] = "新值"
dic["aa"] = "11"
dic["bb"] = "22"

// 改 (当键存在时是修改,当不存在时是新增)
dic["新键"] = "另一个值"

dic.updateValue("33", forKey: "bb")
dic
// 查
let velueDic = dic["新键"]

// 遍历
// 使用元组查询
for (key, velue) in dic {
    
    print("使用元组查询>>\(key) : \(velue)")
}
// 以key查询
for key in dic.keys {
    
    print("以key查询>>\(key) : \(dic[key])")
}
// 以value遍历
for value in dic.values {
    
    print("\(value)")
}

//字典的拷贝
//无论何时将一个字典实例赋值给一个常量或者变量,或者传递给一个函数或方法,这个字典会在赋值或调用时发生拷贝
var ages = ["perter": 23,"wei": 35]
var copiedAges = ages

//改变copiedAges中的值
copiedAges["wei"] = 0
//这是ages中的值是不变的
ages["wei"]
//这其实已经是两个独立的字典


// ****************************************

// ****************************************
