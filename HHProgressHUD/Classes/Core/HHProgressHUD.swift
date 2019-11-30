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
    /// 供其他模块使用
    public static var bundle: Bundle? {
        let temBundle = Bundle(for: HHProgressHUD.self)
        if let url = temBundle.url(forResource: "HHProgressHUD", withExtension: "bundle") {
            let bundle = Bundle(url: url)
            return bundle ?? temBundle
        }
        return temBundle
    }
}

// MARK: - Toast

public extension HHProgressHUD {
    static func toast(_ message: String,
                      duration: TimeInterval? = nil,
                      position: Position = .bottom,
                      verticalOffset: CGFloat? = nil) {
        Toast.deplay(message,
                     duration: duration,
                     position: .bottom,
                     verticalOffset: verticalOffset)
    }

    static func setStyle(styles: ToastStyles) {
        Toast.shared.styles = styles
    }
}

// MARK: - HUD

public extension HHProgressHUD {
    static func success(_ message: String) {
        Hud.success(message)
    }

    static func error(_ message: String) {
        Hud.error(message)
    }

    static func info(_ message: String) {
        Hud.info(message)
    }

    static func show(_ message: String? = nil) {
        Hud.show(message)
    }

    static func dismiss() {
        Hud.dismiss()
    }

    static func setStyle(styles: HudStyles) {
        Hud.shared.styles = styles
    }
}
