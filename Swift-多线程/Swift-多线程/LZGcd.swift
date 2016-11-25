//
//  LZGcd.swift
//  Swift-多线程
//
//  Created by Artron_LQQ on 2016/11/3.
//  Copyright © 2016年 Artup. All rights reserved.
//

import UIKit

class LZGcd: NSObject {

    // 只执行一次
    // 在swift3中,dispatch_once被废弃了,我们要替换成其他全局或者静态变量和常量
    private var once1: Void = {
        
        // 这里只执行一次
        print("once1")
    }()
    
    private lazy var once2: String = {
        
        // 只执行一次,可用于创建单例
        print("once2")
        
        return "once2"
    }()
    
    // 信号量
    /*
     DispatchSemaphore(value: )：用于创建信号量，可以指定初始化信号量计数值，这里我们默认1.
     semaphore.wait()：会判断信号量，如果为1，则往下执行。如果是0，则等待。
     semaphore.signal()：代表运行结束，信号量加1，有等待的任务这个时候才会继续执行。
     */
    static func sem () {
        
        let queue = DispatchQueue.global(qos: .default)
        
        // 当并行执行任务更新数据时,会产生数据不一样的情况
        
        for i in 1...10 {
            
            queue.async {
                
                print("\(i)")
            }
        }
        
        
        // s使用信号量保证正确性
        // 创建一个初始计数值为1的信号
        let semaphore = DispatchSemaphore(value: 1)
        
        for i in 1...10 {
            
            queue.async {
                // 永久等待,直到semaphore的计数值>=1
                semaphore.wait()
                
                print("semaphore: \(i)")
                
                //任务结束,发信号,使原来的信号计数值+1
                semaphore.signal()
            }
        }
        
    }
    /*
     DispatchQueue.concurrentPerform函数是sync函数和Dispatch Group的关联API。按指定的次数将指定的Block追加到指定的Dispatch Queue中，并等待全部处理执行结束。
     因为concurrentPerform函数也与sync函数一样，会等待处理结束，因此推荐在async函数中异步执行concurrentPerform函数。concurrentPerform函数可以实现高性能的循环迭代。
     */
    func concurrentPerf() {
        
        let queue = DispatchQueue.global(qos: .default)
        
        queue.async {
            
            DispatchQueue.concurrentPerform(iterations: 6, execute: { (inde) in
                
                print(inde)
            })
            
            // 执行完毕,主线程刷新
            DispatchQueue.main.async {
                
                print("done")
            }
        }
        
    }
    
    // 多个任务全部结束后做一个全部结束的处理
    /*
     async(group:)：用来监视一组block对象的完成，你可以同步或异步地监视
     notify()：用来汇总结果，所有任务结束汇总，不阻塞当前线程
     wait()：等待直到所有任务执行结束，中途不能取消，阻塞当前线程
     */
    func moreEnd () {
        
        // 获取系统全局队列
        let queue = DispatchQueue.global()
        
        // 定义一个group
        let group = DispatchGroup()
        
        // 并发任务,顺序执行
        queue.async(group: group){
            
            sleep(2)
            print("block1")
        }
        
        queue.async(group: group) {
            
            print("block2")
        }
        
        queue.async(group: group) {
            
            print("blok3")
        }
        
        // 1. 所有任务执行结束汇总,不阻塞当前线程
        group.notify(queue: .global(), execute: {
            
            print("group done")
        })
        
        // 2. 永久等待,直到所有任务执行结束,中途不能取消,阻塞当前线程
        group.wait()
        print("任务全部结束")
    }
    
    // 延迟调用
    func afterQ() {
        
        // 延迟2秒
        let time = DispatchTime.now() + 2.0
        
        DispatchQueue.global(qos: .default).asyncAfter(deadline: time, execute: {
            
            
        })
    }
    
    // 暂停或继续队列
    // 这两个函数是异步的,而且只在不同的block之间生效,对已经正在执行的任务没有影响
    // suspend()后,追加到Queue中尚未执行的任务在此之后停止执行
    // resume()则使这些任务能够继续执行
    func paseQ() {
        // 创建并行队列
        let queue = DispatchQueue.init(label: "concurrent", attributes: .concurrent)
        
        // 暂停一个队列
        queue.suspend()
        // 继续一个队列
        queue.resume()
    }
    
    func gcdCreate ()  {
        
        // 创建串行队列
        // label: 队列名称
        let serial = DispatchQueue.init(label: "串行队列名称")
        
        // 创建并行队列
        // label: 队列名称
        // attributes: concurrent 并行; default 串行
        let con = DispatchQueue.init(label: "队列名称", attributes: DispatchQueue.Attributes.concurrent)
        
        
        // 获取系统全局队列
        /*qos 优先级
         userInitiated 高
         default 正常
         utility 低
         background 非常低
         */
        let globalQueue = DispatchQueue.global()
        
        let gloabalQ = DispatchQueue.global(qos: .default)
        
        // 获取主队列
        let mainQ = DispatchQueue.main
        
    }
    // 添加任务到队列
    func gcdAdd() {
        
        //方法一 async 异步添加
        DispatchQueue.global().async {
            // 处理耗时的操作
            print("处理任务")
            
            // 操作完成后,要回到主线程刷新UI
            DispatchQueue.main.async {
                
                print("回到主线程")
            }
        }
        
        // 方法二 sync 同步添加
        // 添加同步到global队列
        // 不会造成死锁,但会一直等待代码块执行完毕
        DispatchQueue.global().sync {
            
            print("开始任务")
        }
        
        print("结束任务")
        
        // 添加同步代码块到main队列
        // 会引起死锁
        // 因为在主线程里面添加一个任务,因为是同步,所以要等到添加的任务执行完毕后才能继续走下去
        // 但新添加的任务排在队列的末尾,要执行完成必须等前面的任务执行完成,由此又回到了第一步,程序卡死
        DispatchQueue.main.sync {
            
            print("main sync")
        }
        
        print("main sync end")
    }
}
