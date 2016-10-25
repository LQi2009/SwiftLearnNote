//
//  PhotosViewController.swift
//  ImagePicker
//
//  Created by Artron_LQQ on 2016/10/25.
//  Copyright © 2016年 Artup. All rights reserved.
//

import UIKit
import Photos

class PhotosViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var imageView: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.white
        
        let btn = UIButton.init(type: .custom)
        btn.frame = CGRect.init(x: 100, y: 100, width: 100, height: 30)
        btn.backgroundColor = UIColor.red
        btn.setTitle("打开相册", for: .normal)
        btn.addTarget(self, action: #selector(open), for: .touchUpInside)
        self.view.addSubview(btn)
        
        
        imageView = UIImageView.init()
        imageView?.frame = CGRect.init(x: 10, y: 220, width: 300, height: 300)
        imageView?.contentMode = UIViewContentMode.scaleAspectFit
        self.view.addSubview(imageView!)
    }

    func open() {
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            
            let picker = UIImagePickerController.init()
            picker.delegate = self
            picker.sourceType = .photoLibrary
            
            self.present(picker, animated: true, completion: nil)
        } else {
            
            print("打开相册失败")
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let pickedURL: URL = info[UIImagePickerControllerReferenceURL] as! URL
        let fetchResult: PHFetchResult = PHAsset.fetchAssets(withALAssetURLs: [pickedURL], options: nil)
        let asset: PHAsset = fetchResult.firstObject!
        
        PHImageManager.default().requestImageData(for: asset, options: nil) { (data, string, orientation, info) in
            
            // 获取真实路径
            let imageNSURL: URL = info!["PHImageFileURLKey"] as! URL
            
            print("文件路径",imageNSURL)
            print("文件名",imageNSURL.lastPathComponent)
            
            let data = NSData.init(contentsOf: imageNSURL as URL)
            self.imageView?.image = UIImage.init(data: data as! Data)
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
