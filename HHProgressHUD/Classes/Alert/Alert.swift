//
//  Alert.swift
//  DynamicBlurView
//
//  Created by ios on 2019/11/30.
//

import PopupDialog
import SwiftEntryKit
import UIKit
extension Position {
    var alert_attributes: EKAttributes {
        switch self {
        case .top:
            return EKAttributes.hh_alert_top
        case .center:
            return EKAttributes.hh_alert_center
        case .bottom:
            return EKAttributes.hh_alert_bottom
        }
    }
}

class Alert {
    public var styles: AlertStyles = AlertStyles()

    public static var shared: Alert = Alert()
    private init() {}

    static func deplay(_ entry: UIView,
                       position: Position = .bottom,
                       verticalOffset: CGFloat? = nil) {
        var attributes = position.alert_attributes
        attributes.displayMode = .inferred
        attributes.scroll = .edgeCrossingDisabled(swipeable: true)
        attributes.entranceAnimation = .init(
            translate: .init(
                duration: 0.5,
                spring: .init(damping: 1, initialVelocity: 0)
            )
        )
        attributes.entryBackground = .color(color: EKColor(red: 255, green: 255, blue: 255))
        attributes.screenBackground = .color(color: EKColor(red: 50, green: 50, blue: 50).with(alpha: 0.5))

        attributes.positionConstraints = .fullWidth
        attributes.positionConstraints.safeArea = .empty(fillSafeArea: true)
        SwiftEntryKit.display(entry: entry, using: attributes)
    }

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
        buttonTwo.titleColor = UIColor.blue
        // Add buttons to dialog
        popup.addButtons([buttonOne, buttonTwo])
        // Present dialog

        vc.present(popup, animated: true, completion: nil)
    }
}
