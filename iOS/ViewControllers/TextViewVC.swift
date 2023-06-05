//
//  VCTextView.swift
//  iOS
//
//  Created by Shubham Jitiya on 25/04/23.
//

import UIKit

class TextViewVC: UIViewController {
    //MARK: Outlets
    @IBOutlet private weak var txtView: UITextView!
    
    //MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialise()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true) 
        txtView.becomeFirstResponder()
    }
}

// MARK: Extension function
extension TextViewVC {
    private func initialise() {
        txtView.becomeFirstResponder()
        properties()
    }
    private func properties() {
        txtView.dataDetectorTypes = .link
        txtView.returnKeyType = .go
        txtView.autocapitalizationType = .words
        txtView.autocorrectionType = .yes
        txtView.textContainerInset = .init(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0)
        txtView.text = "https://www.google.com/"
    }
}

// MARK: Extension delegate
extension TextViewVC: UITextViewDelegate {
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        print("Should begin")
        return true
    }
    
    func textView(
        _ textView: UITextView,
        shouldChangeTextIn range: NSRange,
        replacementText text: String) -> Bool {
            print(range.location)
            print(text)
            return true
        }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        print("Did begin editing", textView.text ?? "")
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        print("Did end editing", textView.text ?? "")
    }
}
