//
//  CustomTextView.swift
//  iOS
//
//  Created by Shubham Jitiya on 25/05/23.
//

import UIKit

@IBDesignable
class CustomTextView: UITextView {
    @IBInspectable var insetTop: CGFloat = 0
    @IBInspectable var insetLeft: CGFloat = 0
    @IBInspectable var insetBottom: CGFloat = 0
    @IBInspectable var insetRight: CGFloat = 0
    
    // MARK: - IBInspectable properties
    @IBInspectable var placeholderText: String? {
        didSet {
            self.text = placeholderText
            self.textColor = placeholderColor
        }
    }

    @IBInspectable var placeholderColor: UIColor = .lightGray {
        didSet {
            if self.text == placeholderText {
                self.textColor = placeholderColor
            }
        }
    }

    @IBInspectable var borderColor: UIColor = .black {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }

    @IBInspectable var borderWidth: CGFloat = 1 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    // MARK: - Initializers
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
        addBtnDoneInKeyboard()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let insets = UIEdgeInsets(top: insetTop, left: insetLeft, bottom: insetBottom, right: insetRight)
        textContainerInset = insets
    }
}

// MARK: Functions
extension CustomTextView {
    
    private func setupView() {
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = cornerRadius > 0
        self.delegate = self
    }
    
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
}

// MARK: Delegate - TextView
extension CustomTextView: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == placeholderColor {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = placeholderText
            textView.textColor = placeholderColor
        }
    }
}
