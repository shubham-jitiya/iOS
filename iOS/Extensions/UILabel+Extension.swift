//
//  UILabel+Extension.swift
//  iOS
//
//  Created by Shubham Jitiya on 26/05/23.
//

import UIKit

extension UILabel {
    func showInvalidLabel(_ show: Bool) {
        UIView.animate(withDuration: 0.4) {
            self.isHidden = !show
        }
    }
}
