//
//  CustomTextField.swift
//  iOS
//
//  Created by Shubham Jitiya on 21/04/23.
//

import UIKit

protocol DesignableTextFieldDelegate: UITextFieldDelegate {
    func textFieldIconClicked(btn: UIButton)
}

class CustomTextField: UITextField {
    @IBInspectable var leftPadding: CGFloat = 0
    @IBInspectable var rightPadding: CGFloat = 0
    @IBInspectable var clickableImage: UIImage? { didSet { updateView() } }
    @IBInspectable var imageColor: UIColor = UIColor.systemGray { didSet { updateView() }}
    @IBInspectable var rtl: Bool = false { didSet { updateView() }}
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    private func setup() {
        addPadding(left: 13, right: 0)
        addBtnDoneInKeyboard()
    }
    
    private var buttonImageDelegate: DesignableTextFieldDelegate? {
        get { return delegate as? DesignableTextFieldDelegate }
    }
    
    @objc func buttonClicked(btn: UIButton){
        self.buttonImageDelegate?.textFieldIconClicked(btn: btn)
    }
    
    @IBInspectable var placeholderTextColor: UIColor = UIColor.red {
        didSet {
            setPlaceholderTextColor(color: placeholderTextColor)
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
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
    
    @IBInspectable var leftImage: UIImage? {
        didSet {
            if let leftImage {
                setImageToLeft(image: leftImage)
            }
        }
    }
    
    // Padding text field
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.editingRect(forBounds: bounds)
        rect.origin.x += leftPadding
        rect.size.width -= leftPadding + rightPadding
        return rect
    }
    
    // Padding on left of image
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += leftPadding
        return textRect
    }
    
    // Padding on right of image
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.rightViewRect(forBounds: bounds)
        textRect.origin.x -= rightPadding
        return textRect
    }
}

// MARK: - Functions
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
    }
    
    private func setImageToLeft(image: UIImage) {
        let newView = UIView(frame: CGRect(x: 0, y: 0.0, width: frame.size.height, height: frame.size.height))
        let imageView = UIImageView(image: image)
        imageView.contentMode = .center
        imageView.tintColor = .systemGray2
        imageView.frame = CGRect(x: 0, y: 0, width: newView.frame.width, height: newView.frame.height)
        newView.addSubview(imageView)
        leftView = newView
    }
    
    private func setPlaceholderTextColor(color: UIColor) {
        if let placeholder {
            attributedPlaceholder = NSAttributedString(
                string: placeholder,
                attributes:[NSAttributedString.Key.foregroundColor: color]
            )
        }
    }
    
    func updateView() {
        if let image = clickableImage {
            let button = UIButton(type: .custom)
            button.frame = CGRect(x: 0, y: 0, width: frame.size.height, height: frame.size.height)
            
            let tintedImage = image.withRenderingMode(.alwaysTemplate)
            button.setImage(tintedImage, for: .normal)
            button.tintColor = imageColor
            
            button.setTitleColor(UIColor.clear, for: .normal)
            button.addTarget(self, action: #selector(buttonClicked(btn:)), for: UIControl.Event.touchDown)
            button.isUserInteractionEnabled = true
            
            if rtl {
                leftViewMode = UITextField.ViewMode.always
                rightView = button
            } else {
                leftViewMode = UITextField.ViewMode.always
                leftView = button
            }
        }
    }
}
