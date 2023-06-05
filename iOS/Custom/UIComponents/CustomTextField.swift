//
//  CustomTextField.swift
//  iOS
//
//  Created by Shubham Jitiya on 21/04/23.
//

import UIKit

@IBDesignable
class CustomTextField: UITextField {
    @IBInspectable var leftPadding: CGFloat = 0
    @IBInspectable var rightPadding: CGFloat = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    private func setup() {
        addPadding(left: 13, right: 0)
        addBtnDoneInKeyboard()
    }
    
    @IBInspectable public var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var rightImage: UIImage? {
        didSet {
            if let image = rightImage {
                setImageToRight(image: image)
            }
        }
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.textRect(forBounds: bounds)
        rect.size.width -= leftPadding + rightPadding
        return rect
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.editingRect(forBounds: bounds)
        rect.origin.x += leftPadding
        rect.size.width -= leftPadding + rightPadding
        return rect
    }
}

// MARK: Functions
extension CustomTextField {
    
    private func addBtnDoneInKeyboard() {
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let itemDoneButton = UIBarButtonItem(
            title: "Done",
            style: .done,
            target: self,
            action: #selector(doneButtonTapped))
        itemDoneButton.tintColor = UIColor(named: Constants.Colors.primaryColor.rawValue)
        let itemFlexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.items = [itemFlexSpace, itemDoneButton]
        toolbar.sizeToFit()
        self.inputAccessoryView = toolbar
    }
    
    private func setImageToRight(image: UIImage) {
        let newView = UIView(frame: CGRect(x: 0, y: 0.0, width: frame.size.height, height: frame.size.height))
        let imageView = UIImageView(image: image)
        imageView.contentMode = .center
        imageView.tintColor = .systemGray2
        imageView.frame = CGRect(x: 0, y: 0, width: newView.frame.width, height: newView.frame.height)
        newView.addSubview(imageView)
        rightView = newView
        rightViewMode = .always
    }
}
