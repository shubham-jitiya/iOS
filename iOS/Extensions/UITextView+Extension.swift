//
//  UITextView+Extension.swift
//  iOS
//
//  Created by Shubham Jitiya on 25/05/23.
//

import UIKit

extension UITextView {
    // Dismiss keyboard
    func addKeyboardBtnDone() {
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
        self.resignFirstResponder()
    }
}
