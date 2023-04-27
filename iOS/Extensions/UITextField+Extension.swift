//
//  UITextField+Extension.swift
//  iOS
//
//  Created by Shubham Jitiya on 25/04/23.
//

import UIKit

extension UITextField {
    // Padding
    func addLeftPadding(_ padding: Double) {
        let leftView = UIView()
        
        leftView.frame = CGRectMake(0.0, 0.0, padding, self.frame.size.height)
        self.leftView = leftView
        self.leftViewMode = .always
    }
    
    func addRightPadding(_ padding: Double){
        let rightView = UIView()
        
        rightView.frame = CGRect(x: 0, y: 0, width: padding, height: self.frame.size.height)
        self.rightView = rightView
        self.rightViewMode = .always
    }
    
    func addPadding(left: Double, right: Double){
        let leftView = UIView(), rightView = UIView()
        
        rightView.frame = CGRect(x: 0, y: 0, width: right, height: self.frame.size.height)
        leftView.frame = CGRect(x: 0, y: 0, width: left, height: self.frame.size.height)
        self.rightView = rightView
        self.leftView = leftView
        self.rightViewMode = .always
        self.leftViewMode = .always
    }
    
    func addPaddingToImageLeft(_ padding: Double, src: String){
        let leftView = UIView(), imgView = UIImageView.init(image: UIImage.init(systemName: src))
        
        leftView.frame = CGRect(x: 0, y: 0, width: 28.0 + 10, height: self.frame.size.height)
        imgView.frame = CGRect(x: 5.0, y: 5.0, width: 28.0, height: self.frame.size.height - 10.0)
        imgView.tintColor = UIColor.gray
        leftView.addSubview(imgView)
        self.leftView = leftView
        self.leftViewMode = .always
    }
    
    // Dismiss keyboard
    func dismissKeyboard() {
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let itemDoneButton = UIBarButtonItem(
            title: "Done",
            style: .done,
            target: self,
            action: #selector(doneButtonTapped))
        let itemFlexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.items = [itemFlexSpace, itemDoneButton]
        toolbar.sizeToFit()
        self.inputAccessoryView = toolbar
        
    }
    @objc func doneButtonTapped() {
        //dismiss keyboard on tapping done button
        self.resignFirstResponder()
    }
}
