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
    private var progress: ProgressContent = ProgressContent(type: .circleStrokeSpin, color: .white)

    private var message: String?
    private var isShowMessage: Bool = false

    private var style: EKProperty.LabelStyle {
        let styles = Hud.shared.styles
        var labelStyle = EKProperty.LabelStyle.hh_hud
        labelStyle.color = EKColor(styles.color)
        labelStyle.font = styles.font
        labelStyle.numberOfLines = styles.numberOfLines
        labelStyle.alignment = styles.alignment
        return labelStyle
    }

    init(message: String? = nil) {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        self.message = message
        if let text = message, text.count > 0 {
            isShowMessage = true
        }
        setup_subviews()
        setup_layout()
    }

    func start() {
        activityIndi​​catorView.startAnimating()
    }

    func stop() {
        activityIndi​​catorView.stopAnimating()
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
        label.text = message
        label.textColor = style.color(for: traitCollection)
        label.font = style.font
        label.textAlignment = style.alignment
        label.numberOfLines = 1
        label.lineBreakMode = .byCharWrapping
        label.backgroundColor = .clear
        label.sizeToFit()
        label.isHidden = !isShowMessage
        label.translatesAutoresizingMaskIntoConstraints = false
        self.label = label
    }

    /// setup Layout
    func setup_layout() {
        let maxSize = CGSize(width: UIScreen.main.bounds.width / 2, height: 20)
        let width = isShowMessage ? label.hh_computeWidth(by: CGSize(width: maxSize.width, height: 20)) : 50
        let padding: CGFloat = isShowMessage ? 20 : 0
        addSubview(activityIndi​​catorView)
        NSLayoutConstraint.activate([
            activityIndi​​catorView.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndi​​catorView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            activityIndi​​catorView.widthAnchor.constraint(equalToConstant: 50),
            activityIndi​​catorView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: activityIndi​​catorView.bottomAnchor, constant: padding),
            label.heightAnchor.constraint(equalToConstant: 20),
            label.widthAnchor.constraint(equalToConstant: width),
            label.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            label.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding)
        ])
    }

    /// update UI
    func update_layout() {}
}
