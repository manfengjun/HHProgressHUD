//
//  HHProgressHUD.swift
//  HHProgressHUD_Example
//
//  Created by ios on 2019/11/29.
//  Copyright © 2019 iOS. All rights reserved.
//

import SwiftEntryKit
import UIKit
public enum Position {
    case top
    case center
    case bottom

    var ek: EKAttributes.Position {
        switch self {
        case .top:
            return EKAttributes.Position.top
        case .center:
            return EKAttributes.Position.center
        case .bottom:
            return EKAttributes.Position.bottom
        }
    }
}

public class HHProgressHUD {
    public static var shared: HHProgressHUD = HHProgressHUD()

    private init() {}
}

public extension HHProgressHUD {
    public static func toast(_ message: String,
                      duration: TimeInterval? = nil,
                      position: Position = .bottom,
                      verticalOffset: CGFloat? = nil) {
        Toast.deplay(message,
                     duration: duration,
                     position: .bottom,
                     verticalOffset: verticalOffset)
    }

    public static func setStyle(styles: ToastStyles) {
        Toast.shared.styles = styles
    }
}
