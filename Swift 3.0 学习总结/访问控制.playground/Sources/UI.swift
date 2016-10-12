//Sources 文件夹下只能定义类, 不能调用

import UIKit

var str = "Hello, playground"


enum Theme {
    case DayMode
    case NightMode
}

class UI {
    
    private var fontColor: UIColor!
    private var backgroundColor: UIColor!
    internal var themeMode: Theme = .DayMode {
        // 在实例初始化的时候不调用
        didSet {
            
            self.changeTheme(themeMode: themeMode)
        }
    }
    
    init(){
        
        self.themeMode = .DayMode
        self.changeTheme( themeMode: self.themeMode)
    }
    init(themeMode: Theme) {
        self.themeMode = themeMode
        
        self.changeTheme(themeMode: themeMode)
    }
    
    private func changeTheme(themeMode: Theme) {
        
        switch themeMode {
        case .DayMode:
            fontColor = UIColor.blue
            backgroundColor = UIColor.white
      case .NightMode:
        fontColor = UIColor.white
        backgroundColor = UIColor.black
        }
    }
    
    func show() {
        print("The font color is \(fontColor == UIColor.white ? "white" : "black" )")
        
        print("The background color is \(backgroundColor == UIColor.white ? "white" : "black" )")
    }
}



