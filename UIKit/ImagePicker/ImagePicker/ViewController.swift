//
//  ViewController.swift
//  ImagePicker
//
//  Created by Artron_LQQ on 2016/10/24.
//  Copyright © 2016年 Artup. All rights reserved.
//
// NSPhotoLibraryUsageDescription

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }

    @IBAction func openImagePicker(_ sender: AnyObject) {
        
        let image = ImagePickerViewController()
        
        self.navigationController?.pushViewController(image, animated: true)
    }
    @IBAction func openPhotos(_ sender: AnyObject) {
        
        let photo = PhotosViewController()
        
        self.navigationController?.pushViewController(photo, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

