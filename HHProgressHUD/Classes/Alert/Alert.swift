//
//  Alert.swift
//  DynamicBlurView
//
//  Created by ios on 2019/11/30.
//

import PopupDialog
import UIKit
class Alert {
    static func popup(on vc: UIViewController,
                      title: String = "贴心提醒",
                      content: String,
                      sureTitle: String? = nil,
                      cancelTitle: String? = nil,
                      sure: @escaping () -> Void,
                      cancel: @escaping () -> Void) {
        // Create the dialog
        let popup = PopupDialog(title: title,
                                message: content,
                                buttonAlignment: .horizontal,
                                transitionStyle: .zoomIn,
                                tapGestureDismissal: false)
        // Create first button
        let buttonOne = CancelButton(title: cancelTitle ?? "取消") {
            cancel()
        }
        // Create second button
        let buttonTwo = DefaultButton(title: sureTitle ?? "确定") {
            sure()
        }
        buttonTwo.titleColor = UIColor.color_main
        // Add buttons to dialog
        popup.addButtons([buttonOne, buttonTwo])
        // Present dialog

        vc.present(popup, animated: true, completion: nil)
    }
}
