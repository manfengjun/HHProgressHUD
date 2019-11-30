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
        // Create the dialog
//        let popup = PopupDialog(title: "温馨提示",
//                                message: "是否确定删除",
//                                buttonAlignment: .horizontal,
//                                transitionStyle: .zoomIn,
//                                tapGestureDismissal: false)
//        // Create first button
//        let buttonOne = CancelButton(title: "取消") {
//
//        }
//        // Create second button
//        let buttonTwo = DefaultButton(title: "确定") {
//            HHProgressHUD.show()
//        }
//        buttonTwo.dismissOnTap = false
//        buttonTwo.titleColor = UIColor.red
//        // Add buttons to dialog
//        popup.addButtons([buttonOne, buttonTwo])
//        // Present dialog
//
//        self.present(popup, animated: true, completion: nil)
        HHProgressHUD.show()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            HHProgressHUD.dismiss()
        }

//        HHProgressHUD.setStyle(styles: ToastStyles())
//        HHProgressHUD.success("添加成功")
//        HHProgressHUD.toast("网络异常")
    }
}
