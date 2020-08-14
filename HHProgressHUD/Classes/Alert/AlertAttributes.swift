//
//  AlertAttributes.swift
//  DynamicBlurView
//
//  Created by JUN on 2019/11/30.
//

import PopupDialog
import SwiftEntryKit
import UIKit

// MARK: - alert style

public struct AlertStyles {
    public var font: UIFont

    public var color: UIColor

    public var alignment: NSTextAlignment

    public var numberOfLines: Int

    public var displayDuration: TimeInterval

    public init(
        font: UIFont = UIFont.boldSystemFont(ofSize: 18),
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

// MARK: - Alert EKAttributes Extension

extension EKAttributes {
    func alert() -> EKAttributes {
        var attributes = self
        attributes.displayDuration = .infinity
        attributes.displayMode = .inferred
        attributes.scroll = .edgeCrossingDisabled(swipeable: true)
        attributes.screenInteraction = .dismiss
        attributes.entryInteraction = .absorbTouches

        attributes.shadow = .active(
            with: .init(
                color: .black,
                opacity: 0.3,
                radius: 8
            )
        )
        attributes.entryBackground = .color(color: EKColor(red: 255, green: 255, blue: 255))
        attributes.screenBackground = .color(color: EKColor(red: 50, green: 50, blue: 50).with(alpha: 0.5))

        attributes.entranceAnimation = .init(
            translate: .init(
                duration: 0.5,
                spring: .init(damping: 1, initialVelocity: 0)
            ),
            scale: .init(
                from: 1.05,
                to: 1,
                duration: 0.4,
                spring: .init(damping: 1, initialVelocity: 0)
            )
        )
        attributes.exitAnimation = .init(
            translate: .init(duration: 0.2)
        )
        attributes.popBehavior = .animated(
            animation: .init(
                translate: .init(duration: 0.2)
            )
        )
        attributes.positionConstraints.verticalOffset = 10
        attributes.positionConstraints.size = .init(
            width: .offset(value: 20),
            height: .intrinsic
        )
        attributes.positionConstraints.maxSize = .init(
            width: .constant(value: UIScreen.main.minEdge),
            height: .intrinsic
        )
        attributes.positionConstraints = .fullWidth
        attributes.positionConstraints.safeArea = .empty(fillSafeArea: true)

        attributes.roundCorners = .all(radius: 10)

        attributes.statusBar = .dark
        return attributes
    }
}

extension CGRect {
    var minEdge: CGFloat {
        return min(width, height)
    }
}

extension UIScreen {
    var minEdge: CGFloat {
        return UIScreen.main.bounds.minEdge
    }
}
