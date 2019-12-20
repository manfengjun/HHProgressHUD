//
//  HudAttributes.swift
//  HHProgressHUD
//
//  Created by ios on 2019/11/30.
//

import SwiftEntryKit
import UIKit

// MARK: - hud label style

public struct HudStyles {
    public var font: UIFont

    public var color: UIColor

    public var alignment: NSTextAlignment

    public var numberOfLines: Int

    public var displayDuration: TimeInterval

    public init(
        font: UIFont = UIFont.systemFont(ofSize: 18),
        color: UIColor = .white,
        alignment: NSTextAlignment = .center,
        numberOfLines: Int = 0,
        displayDuration: TimeInterval = 3
    ) {
        self.font = font
        self.color = color
        self.alignment = alignment
        self.numberOfLines = numberOfLines
        self.displayDuration = displayDuration
    }
}

// MARK: - Hud EKAttributes Extension

extension EKAttributes {
    static var hh_hud: EKAttributes {
        var attributes = EKAttributes.centerFloat
        attributes.positionConstraints.safeArea = .empty(fillSafeArea: false)
        attributes.windowLevel = .statusBar
        attributes.screenInteraction = .absorbTouches
        attributes.entryInteraction = .absorbTouches
        attributes.displayDuration = 3
        attributes.hapticFeedbackType = .none
        attributes.popBehavior = .animated(
            animation: .init(
                fade: .init(
                    from: 1.0, to: 0, duration: 0.01
                )
            )
        )
        attributes.entryBackground = .color(color: EKColor(red: 50, green: 50, blue: 50))
        attributes.entranceAnimation = .init(
            scale: .init(
                from: 0.9,
                to: 1,
                duration: 0.4,
                spring: .init(damping: 1, initialVelocity: 0)
            ),
            fade: .init(
                from: 0,
                to: 1,
                duration: 0.3
            )
        )
        attributes.exitAnimation = .init(
            fade: .init(
                from: 1,
                to: 0,
                duration: 0.2
            )
        )
        attributes.shadow = .active(with: .init(color: EKColor(red: 50, green: 50, blue: 50), opacity: 0.5, radius: 5))
        attributes.statusBar = .dark
        attributes.roundCorners = .all(radius: 15)
        attributes.scroll = .disabled
        attributes.positionConstraints.maxSize = .init(width: .constant(value: min(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height)), height: .intrinsic)
        return attributes
    }
}

// MARK: - Hud LabelStyle Extension

extension EKProperty.LabelStyle {
    static var hh_hud: EKProperty.LabelStyle {
        let style = EKProperty.LabelStyle(
            font: UIFont.boldSystemFont(ofSize: 18),
            color: .white,
            alignment: .center,
            displayMode: .inferred,
            numberOfLines: 0
        )
        return style
    }
}
