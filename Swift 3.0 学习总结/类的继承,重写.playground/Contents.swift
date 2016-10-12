//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//继承
//不继承自其他类的类,成为基类
class Vehicle {
    var numberOfWheels: Int
    var maxPassengers: Int
    
    func description() -> String {
        
        return "\(numberOfWheels)wheels ; up to \(maxPassengers)"
    }
    
    init() {
        
        numberOfWheels = 0
        maxPassengers = 1
    }
}

class Bicycle: Vehicle {
    
    override init() {
        super.init()
        numberOfWheels = 2
    }
}

let bicycle = Bicycle()
bicycle.description()

//重写方法

class Car: Vehicle {
    var speed: Double = 0.0
    
    override init() {
        super.init()
        
        maxPassengers = 5
        numberOfWheels = 4
    }
    
    override func description() -> String {
        return super.description() + ";" + "traveling at \(speed) mph"
    }
    
}

let car = Car()
car.description()

//重写属性
class SpeedLimitedCar: Car {
    override var speed: Double {
        
        get {
            return super.speed
        }
        
        set {
            
            super.speed = min(newValue, 40.0)
        }
    }
}


let  limitedCar = SpeedLimitedCar()
limitedCar.speed = 50.0
limitedCar.speed


class AutomaticCar: Car {
    var gear = 1
    
    override var speed: Double {
        
        didSet {
            gear = Int(speed/10.0) + 1
        }
    }
    
    override func description() -> String {
        return super.description() + "in gear \(gear)"
    }
}

let auro = AutomaticCar()
auro.speed = 35.0
auro.description()

//防止被重写
//如果想让一个类或其属性方法不被重写,可在其前加final关键字,加final关键字的类不能被继承,属性和方法不能被重写
final class ar {
    
    init () {
        
    }
}


class StepCount {
    
    var totalSteps: Int = 0 {
        willSet(newTotalSetps) {
            print(newTotalSetps)
        }
        
        didSet {
            if totalSteps > oldValue {
                print ("\(totalSteps - oldValue)")
            }
        }
    }
}


//构造过程
// 存储型属性的初始化赋值
//构造器
struct Fahrenheit {
    
    var temperature: Double
    
    init() {
        
        temperature = 32.0
    }
}


var f = Fahrenheit()
f.temperature

//构造参数
struct Celsius {
    var temperatureInCelsius:Double = 0.0
    
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0)/1.8;
    }
    
    init(fromKevin kevin: Double) {
        temperatureInCelsius = kevin - 273.15
    }
}


let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
boilingPointOfWater.temperatureInCelsius

let freezing = Celsius(fromKevin: 273.15)
freezing.temperatureInCelsius

//可选类型
class SurveyQuestion {
    var text: String
    var response: String?
    
    init(text: String) {
        
        self.text = text
    }
    
    func ask() {
        print(text)
    }
}

let cheeeseQuestion = SurveyQuestion(text: "Do you like cheese ?")
cheeeseQuestion.ask()
cheeeseQuestion.response = "yes .i do like"


//构造过程中 常量 属性的修改

class SurveyQuestion1 {
    let text: String
    var response: String?
    
    init(text: String) {
        
        self.text = text
    }
    
    func ask() {
        print(text)
    }
}

let cheeeseQuestion1 = SurveyQuestion1(text: "Do you like cheese ?")
cheeeseQuestion1.ask()
cheeeseQuestion1.response = "yes .i do like"


//默认构造器
class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}

var item = ShoppingListItem()
item.name


//结构体的逐一成员构造器
struct Size {
    var width = 0.0, height = 0.0
    
}

let twoByTwo = Size(width: 2.0, height: 2.0)
twoByTwo.width


//值类型的构造器代理
//构造器可以通过调用其他构造器来完成实例的部分构造过程
//构造器代理的实现,在值类型和类类型中有所不同
//值类型(结构体和枚举)不支持继承,所以构造器代理的过程相对简单


//值类型
struct Point {
    var x = 0.0, y = 0.0
    
}

struct Rect {
    var origin = Point()
    var size = Size()
    init(){
        
    }
    
    init(origin: Point,size: Size) {
        self.origin = origin
        self.size = size
    }
    
    init(center: Point, size: Size) {
        let originX = center.x - (size.width/2)
        let originY = center.y - (size.height/2)
        self.init(origin: Point(x: originX,y: originY),size: size)
    }
}

let basicRect = Rect()

let originRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))


//构造器的继承
class Food {
    var name:String
    init(name: String) {//指定构造器
        self.name = name
    }
    
    convenience init() {//便利构造器
        self.init(name: "[Unnamed]")
    }
}

let nameMeat = Food(name: "Bacon")
nameMeat.name

let unNamed = Food()
unNamed.name


class RecipeIngredient: Food {
    var quantity: Int
    init(name: String,quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    
    convenience override init(name: String) {
        self.init(name: name,quantity: 1)
    }
}

let oneMystery = RecipeIngredient()
let oneBacon = RecipeIngredient(name: "bacon")
let sixEggs = RecipeIngredient(name: "eggs", quantity: 6)


class ShoppingListItem1: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity)x \(name)"
        
        output += purchased ? "?": "?"
        
        return output
    }
}

var brealfastList = [ShoppingListItem1(),ShoppingListItem1(name: "bacon"),ShoppingListItem1(name: "egg", quantity: 6)]

brealfastList[0].name = "orange juice"
brealfastList[0].purchased = true

for ite in brealfastList {
    
    print(ite.description)
}

//通过闭包和函数来设置属性的默认值
//class SomeClass {
//    
//    let someProperty: SomeType = {
//        
//        //在这个闭包中给someProperty 创建一个默认值
//        //someValue 必须和SomeType 类型相同
//        
//        return someValue
//    }()//注意这里有个小括号,表示将此闭包的返回值赋值给porperty,而不是闭包
//    
//}

//注意: 如果使用闭包来初始化属性的值,请记住在闭包执行时,实例的其他部分都还没有初始化,这意味着你不能再闭包内访问其他的属性,即使这个属性有默认值,同样也不能使用隐式的self属性,或者调用实例方法

struct Checkerboard {
    let boardColors: [Bool] = {
        
        var temporaryBoard = [Bool]()
        var isBlack = false
        
        for i in 1...10 {
            
            for j in 1...10 {
                
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            
            isBlack = !isBlack
        }
        
        return temporaryBoard
    }()
    
    func squareIsBlackAtRow(row: Int, colum: Int) -> Bool {
        
        return boardColors[(row*10) + colum]
    }
}

let board = Checkerboard()

board.squareIsBlackAtRow(row: 0, colum: 1)
board.squareIsBlackAtRow(row: 9, colum: 9)


//反初始化器
struct Bank {
    
    static var coinsInBank = 10_000
    static func vendCoins( numberOfCoinsToVend: Int) -> Int {
        
        var numberOfCoinsToVend = numberOfCoinsToVend
        numberOfCoinsToVend = min(numberOfCoinsToVend, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        
        return numberOfCoinsToVend
    }
    
    static func receiveCoins(coins: Int){
        
        coinsInBank += coins
    }
}

class Player {
    
    var coinsInPurse: Int
    init(coins: Int) {
        
        coinsInPurse = Bank.vendCoins(numberOfCoinsToVend: coins)
    }
    
    func winCoins(coins: Int) {
        
        coinsInPurse += Bank.vendCoins(numberOfCoinsToVend: coins)
    }
    
    deinit {
        
        Bank.receiveCoins(coins: coinsInPurse)
    }
    
}


//内存管理
class Person {
    
    let name: String
    init(name: String) {
        
        self.name = name
        print("\(name) is being initailized")
    }
    
    
    deinit {
        
        print("\(name) is being deinit")
    }
}

var referencel1: Person?
var referencel2: Person?
var referencel3: Person?

referencel1 = Person(name: "zhang san")//引用一次
referencel2 = referencel1//引用两次
referencel3 = referencel2//引用三次

referencel1 = nil//取消引用一次
referencel2 = nil//取消引用两次

referencel3 = nil//取消引用三次,deinit调用



//强引用环
class People {
    
    let name: String
    init (name: String) {
        
        self.name = name
    }
    
    var apart: Apartment?
    deinit {
        
        print("\(name) is being deinit")
    }
}

class Apartment {
    
    let number: Int
    init (number: Int){
        
        self.number = number
    }
    
    var tenant: People?
    
    deinit {
        
        print("apartment #\(number) is deinit")
    }
    
}

var john: People?
var number73: Apartment?

//初始化实例
john = People(name: "john Appleseed")
number73 = Apartment(number: 73)

//然后赋值
john!.apart = number73
number73!.tenant = john

//当赋nil的时候  并不会释放内存,john的属性apart持有Apartment对象;number73的tenant属性持有People对象
john = nil
number73 = nil

//解决实例间的强引用环
//弱引用 和 无主引用

//对于生命周期中引用会变为nil的实例,使用弱引用
//对于初始化时赋值之后引用再也不会赋值为nil的实例,使用无主引用

//弱引用

class People1 {
    let name: String
    init(name: String) {
        
        self.name = name
    }
    
    var apart: Apartment1?
    
    deinit {
        
        print("join1 deinit")
    }
    
    
}

class Apartment1 {
    let number: Int
    init(number: Int){
        
        self.number = number
    }
    
    weak var teant: People1?//弱引用
    deinit {
        
        print("\(number) deinit")
    }
}

var john1:People1?
var number731: Apartment1?

john1 = People1(name: "john")
number731 = Apartment1(number: 73)

john1!.apart = number731;
number731!.teant = john1

john1 = nil

number731 = nil

//无主引用
//无主引用和默认有初始值,只能定义非可选类型,在属性,变量前加unowned关键字声明一个无主引用

class Customer {
    
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) deinit")
    }
    
}

class CreditCard {
    let number: Int
    unowned let customer: Customer
    init(number: Int,customer: Customer) {
        
        self.number = number
        self.customer = customer
    }
    deinit {
        print("Card #\(number) is being deinit")
    }
}

var john2:Customer?

john2 = Customer(name: "john")
john2!.card = CreditCard(number: 12345, customer: john2!)


//当john2赋值为ni的时候
john2 = nil

//闭包产生的循环引用
class HTMLElement {
    
    let name: String
    let text: String?
    
    lazy var asHTML:() -> String = {
        if let text = self.text {
            
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name)>"
        }
    }
    
    init(name: String, text: String? = nil) {
        
        self.name = name
        self.text = text
    }
    
    deinit {
        
        print("\(name) is being deinit")
    }
}


