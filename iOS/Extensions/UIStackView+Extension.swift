//
//  UIStackView+Extension.swift
//  iOS
//
//  Created by Shubham on 02/06/23.
//

import UIKit

extension UIStackView {
    func showStack(_ show: Bool) {
        UIView.animate(withDuration: 0.4) {
            self.isHidden = !show
        }
    }
}
