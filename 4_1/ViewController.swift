//
//  ViewController.swift
//  4_1
//
//  Created by student on 2018/12/5.
//  Copyright © 2018年 Dude. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let manager=FileManager.default
        let document = manager.urls(for:  .documentDirectory, in:  .userDomainMask).first?.path
        let file = document?.appending("/image")//图片文件夹
        //print(document!)输出Document路径,fangbianchakan
        if manager.fileExists(atPath: file!) {//若该文件夹存在
            let image = file?.appending("/bd.png")//图片文件
            if manager.fileExists(atPath: image!){//若该文件存在，则显示到界面上
                do{
                    let data = try Data(contentsOf: URL(fileURLWithPath: image!))
                    let img = UIImage(data: data)
                    let imageView = UIImageView(image: img)
                    imageView.frame = CGRect(x: 0, y: 100, width: 400, height: 300)
                    self.view.addSubview(imageView)
                }catch{
                    print(error)
                }
                
            }else{
                //若文件不存在
                let url = URL(string: "https://ss0.bdstatic.com/5aV1bjqh_Q23odCf/static/superman/img/logo/bd_logo1_31bdc765.png")
                do{
                    let data = try Data(contentsOf: url!)
                    try data.write(to: URL(fileURLWithPath: image!), options: .atomicWrite)
                    print("文件不存在，已成功创建文件")
                }catch{
                    print(error)
                }
                
            }
            
        }
        else{
            //w文件夹不存在，则创建文件夹
            do{
            
                try manager.createDirectory(atPath: file!, withIntermediateDirectories: true, attributes: nil)
                print("文件夹不存在，已成功创建文件夹")
            }catch{
                print(error)
            }
        }
        
    }


}

