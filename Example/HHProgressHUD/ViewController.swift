//
//  ViewController.swift
//  HHProgressHUD
//
//  Created by ios on 2019/11/29.
//  Copyright © 2019 iOS. All rights reserved.
//

import UIKit
import HHProgressHUD
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func click(_ sender: Any) {
        print("弹出")
        HHProgressHUD.setStyle(styles: ToastStyles())
        HHProgressHUD.toast("请求失败，请稍后重试!")
    }
    
}

