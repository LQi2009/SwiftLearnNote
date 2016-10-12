//
//  LZTableViewCell.swift
//  SimpleTable
//
//  Created by Artron_LQQ on 16/8/3.
//  Copyright © 2016年 Artup. All rights reserved.
//

import UIKit

// 声明cell的代理
@objc protocol LZCellDelegate {
    
    func cellButtonClick(button: UIButton)
    
    @objc optional func cellClick()
}


class LZTableViewCell: UITableViewCell{

    var delegate: LZCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setUI()
    }
    
    func setUI() {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 10, y: 10, width: 200, height: 20)
        button.backgroundColor = UIColor.red
        button.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        self.addSubview(button)
    }
    
    func buttonClick(button: UIButton) {
        
        delegate?.cellButtonClick(button: button)

        delegate?.cellClick!()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
