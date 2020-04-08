//
//  Hud.swift
//  HHProgressHUD
//
//  Created by ios on 2019/11/30.
//

import NVActivityIndicatorView
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
        }
    }
}

class Hud {
    public var styles: HudStyles = HudStyles()

    public static var shared: Hud = Hud()
    private init() {}
    public static func deplay(_ message: String,
                              duration: TimeInterval? = nil,
                              hudType: HUDType) {
        let styles = Hud.shared.styles
        var attributes = EKAttributes.hh_hud
        attributes.displayDuration = duration == nil ? styles.displayDuration : duration!
        var labelStyle = EKProperty.LabelStyle.hh_hud
        labelStyle.color = EKColor(styles.color)
        labelStyle.font = styles.font
        labelStyle.numberOfLines = styles.numberOfLines
        labelStyle.alignment = styles.alignment
        let hud = HudView(with: EKProperty.LabelContent(text: message,
                                                        style: labelStyle),
                          hudType: hudType)
        SwiftEntryKit.display(entry: hud, using: attributes)
    }

    static func success(_ message: String,
                        duration: TimeInterval? = nil) {
        deplay(message,
               duration: duration,
               hudType: .success)
    }

    static func error(_ message: String,
                      duration: TimeInterval? = nil) {
        deplay(message,
               duration: duration,
               hudType: .error)
    }

    static func info(_ message: String,
                     duration: TimeInterval? = nil) {
        deplay(message,
               duration: duration,
               hudType: .info)
    }
}

extension Hud {
    static func show(_ message: String? = nil) {
        var attributes = EKAttributes.hh_hud
        attributes.displayDuration = .infinity
        let progress = ProgressView(message: message)
        progress.start()
        SwiftEntryKit.display(entry: progress, using: attributes)
    }

    static func dismiss() {
        SwiftEntryKit.dismiss()
    }
}
