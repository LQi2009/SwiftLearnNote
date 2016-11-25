import Foundation
public  class App {
    
    private let ui = UI()
    public var name: String
    
    public init(name: String) {
        
        self.name = name
    }
    
    public func switchMode() {
        
        switch ui.themeMode {
            
        case .DayMode:
            ui.themeMode = .NightMode
            
        case .NightMode:
            ui.themeMode = .DayMode
        }
    }
    
    public func show() {
        
        print("The app name is \(name)")
        ui.show()
    }
    
    private func privateFunc() {
        
        print("This is a private func")
    }
    
    fileprivate func fileprivateFunc() {
        
        print("This is a fileprivate func")
    }
}

public class AppFileprivate: App {
    
    func privateFunc1() {
        
        // 使用private修饰的属性或方法,只能在本类使用,超出本类的代码域(即class后面的{})就不能访问,
//        privateFunc()
        
        // 使用fileprivate修饰的属性或方法,可在同一文件的不同类中访问
        fileprivateFunc()
    }
}
