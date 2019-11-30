//
//  Hud.swift
//  HHProgressHUD
//
//  Created by ios on 2019/11/30.
//

import SwiftEntryKit
import UIKit
public enum HUDType {
    case success
    case error
    case info
    var image: String {
        switch self {
        case .success:
            return "success"
        case .error:
            return "error"
        case .info:
            return "info"
        default:
            return ""
        }
    }
}

class Hud {
    public var styles: HudStyles = HudStyles()

    public static var shared: Hud = Hud()
    private init() {}
    static func deplay(_ message: String, hudType: HUDType) {
        let styles = Hud.shared.styles
        var attributes = EKAttributes.hh_hud
        attributes.displayDuration = styles.displayDuration
        var labelStyle = EKProperty.LabelStyle.hh_hud
        labelStyle.color = EKColor(styles.color)
        labelStyle.font = styles.font
        labelStyle.numberOfLines = styles.numberOfLines
        labelStyle.alignment = styles.alignment
        let toast = HudView(with: EKProperty.LabelContent(text: message,
                                                          style: labelStyle),
                            hudType: hudType)
        SwiftEntryKit.display(entry: toast, using: attributes)
    }

    static func success(_ message: String) {
        deplay(message, hudType: .success)
    }

    static func error(_ message: String) {
        deplay(message, hudType: .error)
    }

    static func info(_ message: String) {
        deplay(message, hudType: .info)
    }
}
