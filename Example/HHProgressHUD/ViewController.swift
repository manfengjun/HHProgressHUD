//
//  ViewController.swift
//  HHProgressHUD
//
//  Created by ios on 2019/11/29.
//  Copyright © 2019 iOS. All rights reserved.
//

import HHProgressHUD
import PopupDialog
import UIKit
class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func click(_ sender: Any) {
        print("弹出")
        let view = ParmentSheet(with: ["现金店","账期店"])
       
        
        HHProgressHUD.alert(view, position: .bottom)
//        HHProgressHUD.popup(on: self, title: "提示", content: "是否确认删除吗？", sureTitle: "确定", cancelTitle: "取消", sure: {
//
//        }) {
//
//        }
        
    }
}

