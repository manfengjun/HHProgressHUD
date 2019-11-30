//
//  HHToast.swift
//  HHProgressHUD_Example
//
//  Created by ios on 2019/11/29.
//  Copyright © 2019 iOS. All rights reserved.
//

import SwiftEntryKit
import UIKit
class Toast {
    public var styles: ToastStyles = ToastStyles()

    public static var shared: Toast = Toast()
    private init() {}

    static func deplay(_ message: String,
                       duration: TimeInterval? = nil,
                       position: Position = .bottom,
                       verticalOffset: CGFloat? = nil) {
        let styles = Toast.shared.styles

        var attributes = EKAttributes.hh_toast
        attributes.displayDuration = duration == nil ? styles.displayDuration : duration!
        attributes.position = position.ek
        attributes.positionConstraints.verticalOffset = verticalOffset == nil ? styles.verticalOffset : verticalOffset!

        var labelStyle = EKProperty.LabelStyle.hh_toast
        labelStyle.color = EKColor(styles.color)
        labelStyle.font = styles.font
        labelStyle.numberOfLines = styles.numberOfLines
        labelStyle.alignment = styles.alignment
        let toast = ToastView(with:
            EKProperty.LabelContent(
                text: message,
                style: labelStyle))
        SwiftEntryKit.display(entry: toast, using: attributes)
    }
}
