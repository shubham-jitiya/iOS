//
//  CustomTextField.swift
//  iOS
//
//  Created by Shubham Jitiya on 21/04/23.
//

import UIKit

class CustomTextField: UITextField {
        // Make the corners rounded with the specified radius
       @IBInspectable public var cornerRadius: CGFloat = 0.0 {
           didSet {
               layer.cornerRadius = cornerRadius
           }
       }
    
    let padding = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 5)
        override open func textRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.inset(by: padding)
        }
}
