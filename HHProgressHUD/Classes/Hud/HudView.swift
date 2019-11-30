//
//  HudView.swift
//  HHProgressHUD
//
//  Created by ios on 2019/11/30.
//

import SwiftEntryKit
import UIKit

class HudView: UIView {
    private var label: UILabel!
    private var icon: UIImageView!
    private var content: EKProperty.LabelContent!
    private var hudType: HUDType!
    init(with message: EKProperty.LabelContent, hudType: HUDType) {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        self.hudType = hudType
        self.content = message
        setup_subviews()
        setup_layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UI

extension HudView {
    /// setup Subviews
    func setup_subviews() {
        translatesAutoresizingMaskIntoConstraints = false

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
        
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: hudType.image, in: HHProgressHUD.bundle, compatibleWith: nil)?.withRenderingMode(.alwaysTemplate)
        icon.image = image
        icon.tintColor = .white
        self.icon = icon
    }

    /// setup Layout
    func setup_layout() {
        addSubview(icon)
        NSLayoutConstraint.activate([
            icon.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            icon.centerXAnchor.constraint(equalTo: centerXAnchor),
            icon.widthAnchor.constraint(equalToConstant: 40),
            icon.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        let maxSize = CGSize(width: UIScreen.main.bounds.width - 160, height: 40)
        let width = label.hh_computeWidth(by: CGSize(width: maxSize.width, height: 20))
        let height = label.hh_computeHeight(by: maxSize)

        addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.topAnchor.constraint(equalTo: icon.bottomAnchor, constant: 15),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            label.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            label.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
            label.widthAnchor.constraint(equalToConstant: width),
            label.heightAnchor.constraint(equalToConstant: height)
        ])
        
        
        
    }

    /// update UI
    func update_layout() {}
}
