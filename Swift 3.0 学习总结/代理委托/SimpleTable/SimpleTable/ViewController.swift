//
//  ViewController.swift
//  SimpleTable
//
//  Created by Artron_LQQ on 16/8/3.
//  Copyright © 2016年 Artup. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource,LZCellDelegate{

    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView = UITableView(frame: self.view.bounds)
        tableView.register(LZTableViewCell.self, forCellReuseIdentifier: "cellID")
        
        self.view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! LZTableViewCell
        
//        cell.textLabel?.text = "hello-\(indexPath.row)"
        // 设置cell的代理
        cell.delegate = self
        return cell
        
    }
    
    //MARK: - LZTableViewCell的代理方法
    func cellButtonClick(button: UIButton) {
        print(button)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

