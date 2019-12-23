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
    public var font: UIFont

    public var color: UIColor

    public var alignment: NSTextAlignment

    public var numberOfLines: Int

    public var displayDuration: TimeInterval

    public var verticalOffset: CGFloat
    public init(font: UIFont = UIFont.systemFont(ofSize: 14),
                color: UIColor = .white,
                alignment: NSTextAlignment = .center,
                numberOfLines: Int = 0,
                displayDuration: TimeInterval = 1.5,
                verticalOffset: CGFloat = 80) {
        self.font = font
        self.color = color
        self.alignment = alignment
        self.numberOfLines = numberOfLines
        self.displayDuration = displayDuration
        self.verticalOffset = verticalOffset
    }
}

// MARK: - Toast EKAttributes Extension

extension EKAttributes {
    static var hh_toast: EKAttributes {
        var attributes = EKAttributes.bottomFloat
        attributes.positionConstraints = .float
        attributes.positionConstraints.safeArea = .empty(fillSafeArea: false)
        attributes.windowLevel = .statusBar
        attributes.displayDuration = 1.5
        attributes.hapticFeedbackType = .none
        attributes.entryInteraction = .absorbTouches
        attributes.entryBackground = .color(color: EKColor(red: 50, green: 50, blue: 50))
        attributes.popBehavior = .overridden
        attributes.shadow = .active(with: .init(color: EKColor(red: 50, green: 50, blue: 50), opacity: 0.5, radius: 5))
        attributes.statusBar = .dark
        attributes.roundCorners = .all(radius: 3)
        attributes.scroll = .disabled
        attributes.precedence = .enqueue(priority: .normal)
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
