//
//  UIView+Extension.swift
//  iOS
//
//  Created by Shubham Jitiya on 26/05/23.
//

import UIKit
extension UIView {
    func addBottomBorder(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: width)
        self.layer.addSublayer(border)
    }
}
