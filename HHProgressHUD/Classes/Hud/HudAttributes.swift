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
    /** Font of the text */
    public var font: UIFont = UIFont.boldSystemFont(ofSize: 18)

    /** Color of the text */
    public var color: UIColor = .white

    /** Text Alignment */
    public var alignment: NSTextAlignment = .center

    /** Number of lines */
    public var numberOfLines: Int = 0

    /** Dismiss TimeInterval */
    public var displayDuration: TimeInterval = 3

    /** vertical offset */
    public var verticalOffset: CGFloat = 80
    public init(font: UIFont = UIFont.boldSystemFont(ofSize: 18),
                color: UIColor = .white,
                alignment: NSTextAlignment = .center,
                numberOfLines: Int = 0,
                displayDuration: TimeInterval = 3) {
        self.font = font
        self.color = color
        self.alignment = alignment
        self.numberOfLines = numberOfLines
        self.displayDuration = displayDuration
    }
}

// MARK: - hud arttributes

public struct HudArttributes {}

// MARK: - Hud EKAttributes Extension

extension EKAttributes {
    static var hh_hud: EKAttributes {
        var attributes = EKAttributes.centerFloat
        attributes.positionConstraints.safeArea = .empty(fillSafeArea: false)
        attributes.windowLevel = .statusBar
        attributes.displayDuration = 3
        attributes.hapticFeedbackType = .success
        attributes.entryInteraction = .absorbTouches
        attributes.entryBackground = .color(color: EKColor(red: 50, green: 50, blue: 50))
        attributes.popBehavior = .animated(animation: .init(translate: .init(duration: 0.3), scale: .init(from: 1, to: 0.7, duration: 0.7)))
        attributes.shadow = .active(with: .init(color: EKColor(red: 50, green: 50, blue: 50), opacity: 0.5, radius: 5))
        attributes.statusBar = .dark
        attributes.roundCorners = .all(radius: 15)
        attributes.scroll = .disabled
        attributes.positionConstraints.maxSize = .init(width: .constant(value: min(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height)), height: .intrinsic)
        attributes.positionConstraints.verticalOffset = 80
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
            numberOfLines: 0)
        return style
    }
}
