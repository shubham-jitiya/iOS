//
//  CustomLabel.swift
//  iOS
//
//  Created by Shubham Jitiya on 01/06/23.
//

import UIKit

class CustomLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
}

// MARK: Functions
extension CustomLabel {
    private func setup() {
        appendEndCharacter()
    }
    
    private func appendEndCharacter() {
        guard let label = self.text else {
            return
        }
        let attributedLabel = NSMutableAttributedString(string: label)
        let endChar = " *"
        let endSymbol = NSAttributedString(string: endChar, attributes: [NSAttributedString.Key.foregroundColor : UIColor.systemRed])
        attributedLabel.append(endSymbol)
        self.attributedText = attributedLabel
    }
}
