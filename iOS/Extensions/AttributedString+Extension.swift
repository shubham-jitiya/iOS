//
//  AttributedString+Extension.swift
//  iOS
//
//  Created by Shubham Jitiya on 24/04/23.
//

import UIKit

extension NSMutableAttributedString {
    // Computed properties
    var fontSize: CGFloat { return 18 }
    var boldFont: UIFont {
        return UIFont(name: "AvenirNext-Bold", size : fontSize) ?? UIFont.boldSystemFont(ofSize: fontSize)
    }
    var normalFont: UIFont {
        return UIFont(name: "AvenirNext-Regular", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
    
    // Functions
    func bold(_ value: String, _ textColor: UIColor = UIColor.black) -> NSMutableAttributedString {
        let attributes: [NSAttributedString.Key : Any] = [
            .font : boldFont,
            .foregroundColor : textColor
        ]
        self.append(NSAttributedString(string: value, attributes: attributes))
        return self
    }
    
    func normal(_ value:String, _ textColor: UIColor = UIColor.black) -> NSMutableAttributedString {
        let attributes: [NSAttributedString.Key : Any] = [
            .font : normalFont,
            .foregroundColor : textColor
        ]
        self.append(NSMutableAttributedString(string: value, attributes: attributes))
        return self
    }
    
    func orangeHighlight(_ value: String, _ textColor: UIColor = UIColor.black) -> NSMutableAttributedString {
        let attributes: [NSAttributedString.Key : Any] = [
            .font : normalFont,
            .foregroundColor : textColor,
            .backgroundColor : UIColor.orange,
        ]
        self.append(NSAttributedString(string: value, attributes: attributes))
        return self
    }
    
    func blackHighlight(_ value: String, _ textColor: UIColor = UIColor.black) -> NSMutableAttributedString {
        let attributes: [NSAttributedString.Key : Any] = [
            .font : normalFont,
            .foregroundColor : textColor,
            .backgroundColor : UIColor.black,
        ]
        self.append(NSMutableAttributedString(string: value, attributes: attributes))
        return self
    }
    
    func underlined(_ value: String, _ textColor: UIColor = UIColor.black) -> NSMutableAttributedString {
        let attributes : [NSAttributedString.Key : Any] = [
            .font : normalFont,
            .underlineStyle : NSUnderlineStyle.single.rawValue,
            .underlineColor : UIColor.white,
            .foregroundColor : textColor
        ]
        append(NSMutableAttributedString(string: value, attributes: attributes))
        return self
    }
}
