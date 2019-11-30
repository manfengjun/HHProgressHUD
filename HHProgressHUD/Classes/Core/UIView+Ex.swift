//
//  HHProgress+Ex.swift
//  HHProgressHUD_Example
//
//  Created by ios on 2019/11/29.
//  Copyright © 2019 iOS. All rights reserved.
//

import UIKit

extension UILabel {
    func hh_computeHeight(by size: CGSize) -> CGFloat {
        let statusLabelText: NSString = (text ?? "") as NSString
        let dic = NSDictionary(object: font!, forKey: NSAttributedString.Key.font as NSCopying)
        let strSize = statusLabelText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic as? [NSAttributedString.Key: Any], context: nil).size
        return strSize.height + 2
    }
    func hh_computeWidth(by size: CGSize) -> CGFloat {
        let statusLabelText: NSString = (text ?? "") as NSString
        let dic = NSDictionary(object: font!, forKey: NSAttributedString.Key.font as NSCopying)
        let strSize = statusLabelText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic as? [NSAttributedString.Key: Any], context: nil).size
        return strSize.width + 2
    }
}
