//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// 属性观察器
// property observer
class LightBulb {
    
    static let maxCurrent = 30
    var current = 0 {
        
        //newCurrent 自定义名称
//        willSet(newCurrent) {
//            
//            print("Current value changed.The change is \(abs(current - newCurrent))")
//        }
        
        //默认名称:newValue
        willSet {
            
            print("Current value changed.The change is \(abs(current - newValue))")
        }
        
        // oldCurrent 自定义名称, 设置新值前的旧值
//        didSet(oldCurrent) {
//            
//            if current == LightBulb.maxCurrent {
//                
//                print("Pay attention")
//            } else if current > LightBulb.maxCurrent {
//                
//                print("current too hight")
//                
//                current = oldCurrent
//            }
//            print("The current is \(current)")
//        }
        // 默认名称 oldValue
        didSet {
            
            if current == LightBulb.maxCurrent {
                
                print("Pay attention")
            } else if current > LightBulb.maxCurrent {
                
                print("current too hight")
                
                current = oldValue
            }
            print("The current is \(current)")
        }
    }
}

let bulb = LightBulb()
bulb.current = 20
bulb.current = 30
bulb.current = 40

enum Theme {
    case DayMode
    case NightMode
}

class UI {
    
    var fontColor: UIColor!
    var backgroundColor: UIColor!
    var themeMode: Theme = .DayMode {
        // 在实例初始化的时候不调用
        didSet {
            switch themeMode {
            case .DayMode:
                fontColor = UIColor.blue
                backgroundColor = UIColor.white
            case .NightMode:
                fontColor = UIColor.white
                backgroundColor = UIColor.black
            }
        }
    }
    
    init(themeMode: Theme) {
        self.themeMode = themeMode
    }
}

let ui = UI(themeMode: .DayMode)
ui.fontColor
ui.backgroundColor


// lazy property
class CloseRange {
    
    let start: Int
    let end: Int
    
    var with: Int {
        
        return end - start + 1
    }
    
    lazy var sum: Int = {
        
        var res = 0
        for i in self.start...self.end {
            res += i
        }
        
        return res
    }()
    
    
    init?(start: Int, end: Int) {
        
        if start > end {
            return nil
        }
        
        self.start = start
        self.end = end
    }
}

if let range = CloseRange(start: 0 ,end: 10_000) {
    
    range.with
    
    range.sum
    
}
