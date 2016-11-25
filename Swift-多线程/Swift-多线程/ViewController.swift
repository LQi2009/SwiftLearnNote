//
//  ViewController.swift
//  Swift-多线程
//
//  Created by Artron_LQQ on 2016/10/31.
//  Copyright © 2016年 Artup. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        LZThread.create()
//        LZOperation.create()
        
        LZGcd.sem()
    }

    
    func thread_test() {
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

