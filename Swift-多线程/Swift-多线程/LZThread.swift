//
//  LZThread.swift
//  Swift-多线程
//
//  Created by Artron_LQQ on 2016/10/31.
//  Copyright © 2016年 Artup. All rights reserved.
//

import UIKit

class LZThread: NSObject {

    /*
     创建的两种方式:
     1. 直接创建,并自动运行线程
     2. 先创建线程对象,然后手动运行线程
     */
    static func create() {
        
        // 1. 使用类方法创建
//        Thread.detachNewThread {
//            
//            print("当前所在的线程为:",Thread.current)
//        }
        
        // 使用类方法,并绑定指定方法, 找不到方法????
//        Thread.detachNewThreadSelector(#selector(LZThread.newMethod), toTarget: self, with: nil)
        
        // 2. 实例方法-
        let myThread = Thread.init()
        
        myThread.start()
    }
    
    func newMethod() {
        
        print("开启新的线程执行任务")
        currentThread()
    }
    
    func currentThread() {
        
        print("当前所在的线程为:",Thread.current)
    }
}
