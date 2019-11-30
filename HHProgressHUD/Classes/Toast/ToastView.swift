//
//  ToastView.swift
//  HHProgressHUD_Example
//
//  Created by ios on 2019/11/29.
//  Copyright © 2019 iOS. All rights reserved.
//

import SwiftEntryKit
import UIKit
public class ToastView: UIView {
    
    private var label: UILabel!
    private var content: EKProperty.LabelContent!
    init(with message: EKProperty.LabelContent) {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        self.content = message
        setup_subviews()
        setup_layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - ToastView UI

extension ToastView {
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
    }
    
    /// setup Layout
    func setup_layout() {
        let maxSize = CGSize(width: UIScreen.main.bounds.width - 40, height: 80)
        let width = label.hh_computeWidth(by: CGSize(width: maxSize.width, height: 20))
        let height = label.hh_computeHeight(by: maxSize)
        
        addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            label.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            label.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            label.widthAnchor.constraint(equalToConstant: width),
            label.heightAnchor.constraint(equalToConstant: height)
        ])
    }
    
    /// update UI
    func update_layout() {}
}
