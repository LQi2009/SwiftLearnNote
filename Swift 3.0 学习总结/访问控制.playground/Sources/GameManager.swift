// 单例

import Foundation

public class GameManager {
    
    public var score = 0
    
    // 单例的写法
    public static let defauleGameManager = GameManager()
    
    private init () {
        
    }
    
    public func addScore () {
        
        score += 10
    }
}