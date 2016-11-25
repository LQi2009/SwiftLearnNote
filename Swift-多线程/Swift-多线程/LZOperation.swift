//
//  LZOperation.swift
//  Swift-多线程
//
//  Created by Artron_LQQ on 2016/11/3.
//  Copyright © 2016年 Artup. All rights reserved.
//

import UIKit

class LZOperation: NSObject {

    static func create() {
        
        
        self.moreOp()
    }
    
    // 直接使用 BlockOperation
    func operationBlok() {
        
        // 创建BlockOperation对象
        let operation = BlockOperation.init {
            
            print(Thread.current)
        }
        // 创建一个 OperationQueue实例,并添加operation
        let queue = OperationQueue()
        queue.addOperation(operation)
    }
    // 使用Operation的子类
    static func subOperation() {
        
        let sunOp = MyOperation()
        
        let queue = OperationQueue()
        
        queue.addOperation(sunOp)
    }
    
    static func moreOp() {
        
        let sunOp = MyOperation()
        let sunOp1 = MyOperation()
        let sunOp2 = MyOperation()
        let sunOp3 = MyOperation()
        let sunOp4 = MyOperation()
        let sunOp5 = MyOperation()
        
        let queue = OperationQueue()
        
        // 设置最大并发数,默认是-1.表示没有限制
        queue.maxConcurrentOperationCount = 3
        queue.addOperation(sunOp)
        queue.addOperation(sunOp1)
        queue.addOperation(sunOp2)
        queue.addOperation(sunOp3)
        queue.addOperation(sunOp4)
        queue.addOperation(sunOp5)
        
        
        // 取消所有线程操作
//        queue.cancelAllOperations()
        
        // 每个operation设置回调,当任务完成时,回调
        sunOp.completionBlock = {() -> Void in
            
            print("sunOP success end")
        }
    }
}

class MyOperation: Operation {
    
    override func main() {
        
        print(Thread.current)
    }
}
