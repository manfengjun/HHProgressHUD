//
//  ProgressView.swift
//  DynamicBlurView
//
//  Created by ios on 2019/11/30.
//

import NVActivityIndicatorView
import SwiftEntryKit
import UIKit
public struct ProgressContent {
    public var type: NVActivityIndicatorType

    public var color: UIColor

    public init(type: NVActivityIndicatorType = .ballClipRotate,
                color: UIColor = .white) {
        self.type = type
        self.color = color
    }
}

class ProgressView: UIView {
    private var label: UILabel!
    private var activityIndi​​catorView: NVActivityIndicatorView!
    private var content: EKProperty.LabelContent!
    private var progress: ProgressContent!
    init(with message: EKProperty.LabelContent,
         and progress: ProgressContent) {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        self.content = message
        self.progress = progress
        setup_subviews()
        setup_layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UI

extension ProgressView {
    /// setup Subviews
    func setup_subviews() {
        translatesAutoresizingMaskIntoConstraints = false
        
        let activityIndi​​catorView = NVActivityIndicatorView(
            frame: CGRect(x: 0, y: 0, width: 50, height: 50),
            type: progress.type,
            color: progress.color)
        activityIndi​​catorView.translatesAutoresizingMaskIntoConstraints = false
        self.activityIndi​​catorView = activityIndi​​catorView
        
        let label = UILabel()
        label.text = content.text
        label.textColor = content.style.color(for: traitCollection)
        label.font = content.style.font
        label.textAlignment = content.style.alignment
        label.numberOfLines = content.style.numberOfLines
        label.lineBreakMode = .byCharWrapping
        label.backgroundColor = .clear
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        self.label = label
    }

    /// setup Layout
    func setup_layout() {
        let bottomOffset = content.text.count > 0 ? -35 : -15
        addSubview(activityIndi​​catorView)
        NSLayoutConstraint.activate([
            activityIndi​​catorView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            activityIndi​​catorView.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            activityIndi​​catorView.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
            activityIndi​​catorView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15)
        ])
        
        addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: activityIndi​​catorView.bottomAnchor, constant: 5),
            label.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            label.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }

    /// update UI
    func update_layout() {}
}
