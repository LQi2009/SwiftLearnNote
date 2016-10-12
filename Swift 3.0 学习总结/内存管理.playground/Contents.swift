//: Playground - noun: a place where people can play

import UIKit

// 析构函数 deinit
class Person {
    
    var name: String
    
    init(name: String) {
        
        self.name = name
        print(name,"is coming")
    }
    
    func doSomething() {
        
        print(name,"is doing something")
    }
    
    deinit {
        
        print(self.name,"is leaving")
        // swift语言会自动管理内存,不需要在这里进行释放内存的操作,可用于检查有无内存泄露
    }
}

var lz: Person? = Person.init(name: "lz")

lz = nil

func inTheShop () {
    
    print("==========")
    let lz = Person(name: "lz")
    
    lz.doSomething()
}

inTheShop()

func inAppStore () {
    
    
    for _ in 1...10 {
        
        print("==========")
        let lz = Person.init(name: "lz")
        lz.doSomething()
    }
}

inAppStore()

// MARK: -强引用循环与weak
print("***************************************")
class People {
    
    var name: String
    var apartment: Apartment?
    
    init(name: String) {
        
        self.name = name
        print(name,"is initialized")
    }
    
    deinit {
        print("People",name,"is being deinitialized")
    }
}

class Apartment {
    
    let name: String
    
    // 避免循环引用,使用weak修饰(弱引用)
    // weak关键字修饰的必须是变量,而且必须是可选型
    weak var tenant: People?
    
    init(name: String) {
        self.name = name
        print("Apartment",name,"is initialized")
    }
    
    deinit {
        print("Apartment",name,"is being deinitialized")
    }
}

var zl: People? = People.init(name: "zl")
var apart: Apartment? = Apartment.init(name: "apart")


zl?.apartment = apart
apart?.tenant = zl

// 内存没有释放,产生内存泄露
apart = nil
zl = nil

// 解决方法: 在两个类的任意一个类的相关属性设置为weak类型

// MARK: -unowned
print("*****************************************")
class Person1 {
    
    var name: String
    var careditCard: CreditCard?
    
    init(name: String) {
        self.name = name
        
        print(name,"is initialized")
    }
    
    deinit {
        print("Person1",name,"is being deinitialized")
    }
}

// 每个信用卡必须有卡主和卡号
class CreditCard {
    
    let number: String
    
    // 1.对于一个信用卡必须有一个卡主,所以Person1不能是可选型
    // 2. 对于一个信用卡,卡主是固定,是不能修改为其他卡主的,因此cutomer只能是常量
    // 所以不能使用weak来解决强引用循环
    // 使用 unowned : 也是一个弱引用,可以是常量,也可以是变量,但是不能是可选型的,就是不能为空
    // 但是有一个缺点
     unowned let customer: Person1
    
    init(number: String, customer: Person1) {
        
        self.number = number
        self.customer = customer
        
        print("CreditCard",number,"is initialized")
    }
    
    deinit {
        print("CreditCard",number,"is being deinitialized")
    }
}

var lzz: Person1? = Person1.init(name: "lzz")
var goldCard: CreditCard? = CreditCard.init(number: "123444", customer: lzz!)
// 将卡给lzz
lzz?.careditCard = goldCard

// 置nil ,内存没有释放,引起循环引用
//lzz = nil
//// 打破循环后,不能再使用unowned修饰的量,否则会编译报错,这就是unowned的缺点
//// 如果使用了unowned了关键字,一定要保证不要提前释放内存空间
//goldCard?.customer
//goldCard = nil

// 如果先释放goldCard,这样是没有问题的
goldCard = nil
lzz = nil
// 这里不会报错的原因是: 在对goldCard进行解包的时候就返回nil了,而不会继续去看customer了,这样使用是安全的
goldCard?.customer

print("************* 隐式可选项的使用 **************")
class Country {
    
    let name: String
    var capital: City!
//    let capital: City
    
    
    init(countryName: String, capitalName: String) {
        
        self.name = countryName
        self.capital = City.init(cityName: capitalName, country: self)
        
        print("Country",name,"is initialized")
    }
    
    deinit {
        print("Country",name, "is being deinitialized")
    }
}

class City {
    
    let name: String
    unowned let country: Country
    
    init(cityName: String, country: Country) {
        
        self.name = cityName
        self.country = country
        
        print("City",name,"is initialized")
    }
    
    deinit {
        print("City",name,"is being deinitialized")
    }
}

var china: Country? = Country.init(countryName: "China", capitalName: "BeiJing")

china = nil

print("********* 闭包中的循环引用 **************")
class SmartAirConditioner {
    
    var temperature: Int = 26
    var temperatureChange: ((Int) ->())!
    
    init() {
        
        temperatureChange = { [weak self] newTemperature in
            
            if let weakSelf = self {
                
                if abs(newTemperature - weakSelf.temperature) >= 10 {
                    
                    print("It's not healthy to do it")
                } else {
                    weakSelf.temperature = newTemperature
                    print("New temperature \(weakSelf.temperature) is set")
                }
            }
        }
    }
    
    deinit {
        print("Smart Air-conditioner is being deinitialized")
    }
}

var airCon: SmartAirConditioner? = SmartAirConditioner.init()
airCon?.temperature
airCon?.temperatureChange(100)
airCon?.temperatureChange(24)

airCon = nil