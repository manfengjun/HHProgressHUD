//
//  Attribute.swift
//  HHProgressHUD_Example
//
//  Created by ios on 2019/11/29.
//  Copyright © 2019 iOS. All rights reserved.
//

import SwiftEntryKit
import UIKit

// MARK: - toast label style

public struct ToastStyles {
    /** Font of the text */
    public var font: UIFont = UIFont.systemFont(ofSize: 14)

    /** Color of the text */
    public var color: UIColor = EKColor(red: 50, green: 50, blue: 50).color(for: .current, mode: .dark)

    /** Text Alignment */
    public var alignment: NSTextAlignment = .center

    /** Number of lines */
    public var numberOfLines: Int = 0
    
    /** Dismiss TimeInterval */
    public var displayDuration: TimeInterval = 3

    /** vertical offset */
    public var verticalOffset: CGFloat = 80

}

// MARK: - toast arttributes

public struct ToastArttributes {
    
}

// MARK: - Toast EKAttributes Extension

extension EKAttributes {
    static var hh_toast: EKAttributes {
        var attributes = EKAttributes.bottomFloat
        attributes.positionConstraints = .float
        attributes.positionConstraints.safeArea = .empty(fillSafeArea: false)
        attributes.windowLevel = .statusBar
        attributes.displayDuration = 3
        attributes.hapticFeedbackType = .success
        attributes.entryInteraction = .absorbTouches
        attributes.entryBackground = .color(color: EKColor(red: 50, green: 50, blue: 50))
        attributes.popBehavior = .animated(animation: .init(translate: .init(duration: 0.3), scale: .init(from: 1, to: 0.7, duration: 0.7)))
        attributes.shadow = .active(with: .init(color: EKColor(red: 50, green: 50, blue: 50), opacity: 0.5, radius: 5))
        attributes.statusBar = .dark
        attributes.roundCorners = .all(radius: 3)
        attributes.scroll = .disabled
        attributes.positionConstraints.maxSize = .init(width: .constant(value: min(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height)), height: .intrinsic)
        attributes.positionConstraints.verticalOffset = 80
        return attributes
    }
}

// MARK: - Toast LabelStyle Extension

extension EKProperty.LabelStyle {
    static var hh_toast: EKProperty.LabelStyle {
        let style = EKProperty.LabelStyle(
            font: UIFont.systemFont(ofSize: 14),
            color: .white,
            alignment: .center,
            displayMode: .inferred,
            numberOfLines: 0)
        return style
    }
}
