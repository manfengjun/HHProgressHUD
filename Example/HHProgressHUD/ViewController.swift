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
        HHProgressHUD.info("斯蒂芬斯蒂芬")
        
    }
}
