//
//  AlertAttributes.swift
//  DynamicBlurView
//
//  Created by JUN on 2019/11/30.
//

import PopupDialog
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
