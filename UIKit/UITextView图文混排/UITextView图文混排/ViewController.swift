//
//  ViewController.swift
//  UITextView图文混排
//
//  Created by Artron_LQQ on 2016/11/4.
//  Copyright © 2016年 Artup. All rights reserved.
//

import UIKit

enum ImageAttachmentMode {
    case Default // 不改变图片大小
    case FitTextLine // 是尺寸自适应行高
    case FitTextView // 使尺寸适应textView
}

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    let textFont = UIFont.systemFont(ofSize: 22)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        insertString(text: "这是一个富文本测试demo")
        insertPicture(image: UIImage(named: "40fe711f9b754b596159f3a6.jpg")!)
        insertString(text: "我们使用文本框（UITextView）时，除了输入文字外，可能还会想在里面插入一些图片。或者有一些图文混排的内容需要展示出来。 这个只需要通过 textView 的属性化文本即可实现。j将图片以附件的形式插入即可。本文通过样例演示如何实现 textView 的图选择插入图片的模式，是保持原图大小，还是自适应尺寸（这些可以混合使用的。）")
        insertPicture(image: UIImage(named: "40fe711f9b754b596159f3a6.jpg")!, mode: .FitTextLine)
        insertString(text: "我们使用文本框（UITextView）时，除了输入文字外，可能还会想在里面插入一些图片。")
        insertPicture(image: UIImage(named: "40fe711f9b754b596159f3a6.jpg")!, mode: .FitTextView)
    }

    //插入图片
    func insertPicture(image: UIImage, mode: ImageAttachmentMode = .Default) {
        
        // 获取textView的所有文本,转成可变的文本
        let mutableStr = NSMutableAttributedString(attributedString: textView.attributedText)
        
        // 创建图片附件
        let imgAttachment = NSTextAttachment()
        var imgAttachmentString: NSAttributedString
        
        imgAttachment.image = image
        
        // 设置图片显示方式
        if mode == .FitTextLine {
            
            // 与文字一样大小
            imgAttachment.bounds = CGRect(x: 0, y: -4, width: (textView.font?.lineHeight)!, height: (textView.font?.lineHeight)!)
        } else if mode == .FitTextView {
            // 撑满一行
            let imageWidth = textView.frame.width - 10
            let imageHeight = image.size.height/image.size.width * imageWidth
            imgAttachment.bounds = CGRect(x: 0, y: 0, width: imageWidth, height: imageHeight)
        }
        
        imgAttachmentString = NSAttributedString(attachment: imgAttachment)
        
        // 获取当前光标位置
        let selectedRange = textView.selectedRange
        
        // 插入文字
        mutableStr.insert(imgAttachmentString, at: selectedRange.location)
        
        // 设置可变文本的字体属性
        mutableStr.addAttributes([NSFontAttributeName: textFont], range: NSRange(location: 0, length: mutableStr.length))
        
        // 再次记住新的光标位置
        let newSelectedRange = NSRange(location: selectedRange.location + 1, length: 0)
        
        // 重新给文本赋值
        textView.attributedText = mutableStr
        
        // 恢复光标的位置(上面一句代码执行之后,光标会移到最后面)
        textView.selectedRange = newSelectedRange
        //移动滚动条(确保光标在可视区域内)
        self.textView.scrollRangeToVisible(newSelectedRange)
    }
    // 插入文字
    func insertString(text: String) {
        
        // 获取textView的所有文本,转成可变的文本
        let mutableStr = NSMutableAttributedString(attributedString: textView.attributedText)
        // 获得目前光标的位置
        let selectedRange = textView.selectedRange
        
        // 插入文字
        let attStr = NSAttributedString(string: text)
        mutableStr.insert(attStr, at: selectedRange.location)
        
        // 设置可变文本的字体属性
        mutableStr.addAttributes([NSFontAttributeName: textFont], range: NSRange.init(location: 0, length: mutableStr.length))
        
        // 再次记住新的光标位置
        let newSelectedRange = NSRange(location: selectedRange.location + attStr.length, length: 0)
        
        // 重新给文本赋值
        textView.attributedText = mutableStr
        
        // 恢复光标的位置(上面一句代码执行之后,光标会移到最后面)
        textView.selectedRange = newSelectedRange
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

