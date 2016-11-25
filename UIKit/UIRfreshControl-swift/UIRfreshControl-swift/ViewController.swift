//
//  ViewController.swift
//  UIRfreshControl-swift
//
//  Created by Artron_LQQ on 2016/11/3.
//  Copyright © 2016年 Artup. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    
    var dataSource: [String] = []
    
    var refresh = UIRefreshControl()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.automaticallyAdjustsScrollViewInsets = false
        
//        tableView.delegate = self
//        tableView.dataSource = self
        loadData()
        
        refresh.addTarget(self, action: #selector(refreshBegin), for: .valueChanged)
        
        refresh.attributedTitle = NSAttributedString(string: "下拉刷新")
        
        tableView.addSubview(refresh)
    }
    
    func refreshBegin() {
        
        self.perform(#selector(loadData), with: nil, afterDelay: 4)
        
        
    }

    func loadData() {
        
        dataSource.removeAll()
        
        let count = arc4random()%100
        
        for i in count...(count+10) {
            
            dataSource.append("数据: \(i)")
        }
        
        tableView.reloadData()
        
        refresh.endRefreshing()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellID")
        if cell == nil {
            
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "cellID")
        }
        
        cell?.textLabel?.text = dataSource[indexPath.row]
        return cell!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

