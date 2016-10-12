//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
// 变量使用 var 定义 
// 常量使用 let 定义
var aVar = "var 用来定义变量"
aVar = "变量的值是可以修改的"

let aLet = "这是一个常量"
//aLet = "常量的值是不能修改的,否则会编译报错"
//变量和常量在创建的时候如果有初始值,不用显性设置其类型,系统会自动推断
//但是如果设置了类型一定要匹配,否则会报错
var aInt:Int = 23
var aDouble:Double = 23.0
//var aString:Int = "这样是会报错的"
let aFloat:Float = 12.0
// ****************************************
// 可选型
// 声明一个可选型
var POSVar: String?

let poss = "12"
let con = Int(poss)//这里返回的是一个可选类型

//可选类型取值要在后面加个感叹号 ! ,前提是一定要保证有值
if (con != nil) {
    print("\(poss)==\(con!)")
} else {
    print("aaa")
}

//隐式解析可选:声明可选类型时,将?改为!就是隐式解析可选

let name:Int! = Int(poss);
print(name)
print(con!)

//区别
let possibleString: String? = "An optinal string"
print(possibleString!)//需要加! 才能取值

let assumeString: String! = "An implicitly unwrapped optional string"
print(assumeString)//直接取值

//使用隐式解析可选,一定要确保有值,否则会报错

// ****************************************

// ****************************************
// 整形
var int = 90 // 设置初始值,隐式定义,swift自动推断变量类型
var int1: Int = 90 // 显示定义变量类型,并赋初始值
var int2: Int // 显示定义变量类
int2 = 100
// swift 3.0 中没有 ++ 运算符
// +1
int += 1

// -1
int1 -= 1

var floa: Float32 = 100

let b = 0b10001//二进制0b开头
let o = 0o21 //8进制0o开头
let x = 0x11 //16进制0x开头

var float1: Double = 100.0

// 不同类型之间的数不能直接比较,必须显示转换为相同类型
if int > Int(float1) {
    
    print("\(int) > \(float1)")
} else {
    
    print("\(float1)>\(int)")
}

// Int(float1) 将double类型转换为整形


let a = 3
let bb = -a
let c = +bb//+ 不改变原值进行返回
let d = -bb
// ****************************************
// 字符串
let string = "这是一个不可变字符串"

// 声明空字符串
var emptyStr = "" //空字符串(可变)
var another = String() //通过初始化函数初始化,都是空字符串

// 判断字符串是否为空
//isEmpty
if emptyStr.isEmpty {
    
    print(emptyStr,"is a empty string")
}

// == ""
if another == "" {
    print(another,"is a empty string too")
}

// 字符串的追加
// +
var newStr = emptyStr + "这是添加的一段字符串"
//append
newStr.append(",又添加了一段")

// 将整形格式化为字符串
let intStr = String(int)
// 整形插入其他字符串
let intStr1 = "\(int) 是一个很好的成绩"

// 计算字符串的长度
let length = intStr1.characters.count
// 计算字符串的utf8编码的字节数
let length1 = intStr1.lengthOfBytes(using: String.Encoding.utf8)

// 比较字符串
// == 
let ast = "a string"
let aa = "a string"

if ast == aa {
    print("equal")
}

// 字符串的基本操作
let string1 = "hello"
let string2 = "there"
let character1: Character = "!"
let character2: Character = "?"

let stringpluschar = string1 + String(character1)

let haspre = string1.hasPrefix("he")
let haspre1 = string1.hasPrefix("eee")

let hassyl = string1.hasSuffix("lo")
let hasul = string1.hasSuffix("aa")
let iseq = string1 == string2

//Unicode属性
let dogstring = "Dog!"
//UTF-8
for codeUnit in dogstring.utf8 {
    print(codeUnit)
}
//UTF-16
for codeUnit in dogstring.utf16 {
    print(codeUnit)
}
//Unicode标量
for codeUnit in dogstring.unicodeScalars {
    print(codeUnit)
}

for codeUnit in dogstring.unicodeScalars {
    print(codeUnit.value)
}

// ****************************************
// 类型转换
// 基本类型之间可以相互转换
// 数字字符串 转 int
let aStrInt = "32"
let aNewInt = Int(aStrInt)

let aStrDouble = "32.0"
let aNewDouble = Double(aStrDouble)
// 需要注意 这里转换之后的类型为可选项,因为可能会转换失败,例如
let aNoIntStr = "aaa"
let aNoInt = Int(aNoIntStr)



// ****************************************
//  高级运算符
//按位取反 ~
let initialBits: UInt8 = 0b00001111
let invertedBits = ~initialBits //0b11110000


//按位与 &
let firstSixBits: UInt8 = 0b11111100
let lastSixBits: UInt8 = 0b00111111

let middleFourBits = firstSixBits & lastSixBits


// 按位或 |

let someBits: UInt8 = 0b10110010
let moreBite: UInt8 = 0b01011110
let combinedBits = someBits | moreBite //11111110


// 按位异或 ^
let firestBits1: UInt8 = 0b00010100
let otherBits: UInt8 = 0b00000101
let outputBits = firestBits1 ^ otherBits //00010001


// 按位左移/右移运算符 <<     >>
//无符号整形的移位操作
let shiftbits: UInt8 = 4 // 即二进制 00000100
shiftbits << 1 // 左移一位       即: 00001000
shiftbits << 2 //移两位          即: 00010000
shiftbits << 5  //              即: 10000000
shiftbits << 6 //               即: 00000000
shiftbits >> 2 //右移两位         即: 00000001


// 溢出运算符

/*
 溢出加法 &+
 溢出减法 &-
 溢出乘法 &*
 溢出除法 &/
 溢出求余 &%
 */

//值的上溢出
var willOverflow = UInt8.max

willOverflow = willOverflow &+ 1
//原值11111111  加1 后变为 100000000,超出了所能表达的最大位数,导致上溢出,保留有效位内的值,即:00000000

//值的下溢出
var willUnderflow = UInt8.min
willUnderflow = willUnderflow &- 1
// 原值 00000000 ,减1后变为 111111111,超出了所能表达的最大位数,导致下溢出,保留有效位内的值,即:11111111

//有符号整形的下溢出
var signedUnderflow = Int8.min
signedUnderflow = signedUnderflow &- 1


// ****************************************
// 数据类型的别名
// typealias 别名关键字

// 给double起一个别名
typealias myDouble = Double
// 下面就可以用这个别名来声明变量, 作用同Double
extension Double {
    
    var km: myDouble {return self * 1000.0}
    var m: myDouble {return self}
    var cm: myDouble{return self/100}
    var ft: myDouble {return self/3.28084}
    
}

let runningDistance: myDouble = 3.54.km

runningDistance



// ****************************************
