//
//  ParmentSheet.swift
//  HHProgressHUD_Example
//
//  Created by ios on 2020/8/14.
//  Copyright © 2020 iOS. All rights reserved.
//

import SwiftEntryKit
import UIKit

public class ParmentSheet: UIView {
    private var items: [UIButton] = []
    private var cancel: UIButton!
    private var titles: [String] = []

    init(with titles: [String]) {
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 0))
        self.titles = titles
        setup_subviews()
        setup_layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UI

extension ParmentSheet {
    /// setup Subviews
    func setup_subviews() {
        translatesAutoresizingMaskIntoConstraints = false

        let cancel = UIButton(type: .custom)
        cancel.setTitle("取消", for: .normal)
        cancel.backgroundColor = UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1)
        cancel.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        cancel.setTitleColor(UIColor(red: 0.39, green: 0.39, blue: 0.39, alpha: 1), for: .normal)
        cancel.translatesAutoresizingMaskIntoConstraints = false
        self.cancel = cancel
    
        self.items = titles.map{
            let button = UIButton(type: .custom)
            button.setTitle($0, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
            button.setTitleColor(UIColor(red: 0.39, green: 0.39, blue: 0.39, alpha: 1), for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }
        
       
    }

    /// setup Layout
    func setup_layout() {
        items.enumerated().forEach{
            addSubview($0.element)
            NSLayoutConstraint.activate([
                $0.element.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat($0.offset * 60)),
                $0.element.leftAnchor.constraint(equalTo: leftAnchor),
                $0.element.rightAnchor.constraint(equalTo: leftAnchor),
                $0.element.heightAnchor.constraint(equalToConstant: 60)
            ])
        }
        
        
        addSubview(cancel)
        NSLayoutConstraint.activate([
            cancel.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat(items.count * 60)),
            cancel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            cancel.rightAnchor.constraint(equalTo: leftAnchor, constant: 10),
            cancel.heightAnchor.constraint(equalToConstant: 40),
            cancel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10)
        ])
        cancel.layer.masksToBounds = true
        cancel.layer.cornerRadius = 20
        
        
    }

    /// update UI
    func update_layout() {}
}

