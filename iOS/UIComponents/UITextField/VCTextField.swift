//
//  VCTextField.swift
//  iOS
//
//  Created by Shubham Jitiya on 25/04/23.
//

import UIKit

class VCTextField: UIViewController, UITextFieldDelegate {
    
    //MARK: - Outlets
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtEmailAddress: UITextField!
    @IBOutlet weak var txtPhoneNumber: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Another way
        //txtUsername.delegate = self
        //txtEmailAddress.delegate = self
        addPadding()
        addDoneButton()
        setLeadingIcons()
        txtUsername.becomeFirstResponder()
        
    }
    
    //MARK: Delegation methods
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("Text field should begin editing", textField.text ?? "")
        //return false //Disable editing
        return true //Enable editing
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("Text field did begin editing", textField.text ?? "")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == txtUsername {
            if let username = textField.text {
                if username.count < 4 {
                    print("User name mustbe greater than 4")
                }
            }
        }
        if textField == txtEmailAddress {
            if let emailId = textField.text {
                if !emailId.contains("@") || !emailId.contains(".") {
                    print("Invalid email address")
                }
            }
        }
        if textField == txtPhoneNumber {
            if let phoneNumber = textField.text {
                if phoneNumber.count < 10 {
                    print("Phone number must be of 10 digit")
                }
            }
        }
        if textField == txtPassword {
            if let pswd = textField.text {
                if pswd.count < 8 {
                    print("Your password must be 8 character long")
                }
            }
        }
    }
    
    //restrict user input | validation
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        print("Should change chars in: ", range.location)
        print(string)
        if textField == txtUsername {
            if range.location < 8 {
                let validCharacters = CharacterSet(
                    charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_")
                return (string.rangeOfCharacter(from: validCharacters.inverted) == nil)
            } else {
                return false
            }
        }
        if textField == txtPhoneNumber {
            if range.location < 10 {
                let validCharacters = CharacterSet(charactersIn: "+0123456789")
                return (string.rangeOfCharacter(from: validCharacters.inverted) == nil)
            } else {
                return false
            }
        }
        if textField == txtEmailAddress {
            if range.location < 40 {
                let validCharacters = CharacterSet(
                    charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789@._-")
                return (string.rangeOfCharacter(from: validCharacters.inverted) == nil)
            } else {
                return false
            }
        }
        if textField == txtPassword {
            if range.location < 12 {
                let validCharacters = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_-+=~`{}[]\\|:;\"'<>,.?/")
                return (string.rangeOfCharacter(from: validCharacters.inverted) == nil)
            } else {
                return false
            }
            
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn: Editing completed")
        if textField == txtUsername {
            txtEmailAddress.becomeFirstResponder()
        } else if textField == txtEmailAddress {
            txtPhoneNumber.becomeFirstResponder()
        } else if textField == txtPhoneNumber {
            txtPassword.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    
    //MARK: Functions
}

extension VCTextField {
    private func addDoneButton() {
        txtUsername.dismissKeyboard()
        txtEmailAddress.dismissKeyboard()
        txtPassword.dismissKeyboard()
        txtPhoneNumber.dismissKeyboard()
    }
    
    private func addPadding() {
        txtUsername.addPadding(left: 4.0, right: 4.0)
        txtEmailAddress.addPadding(left: 4.0, right: 4.0)
        txtPhoneNumber.addPadding(left: 4.0, right: 4.0)
        txtPassword.addPadding(left: 4.0, right: 4.0)
    }
    
    private func setLeadingIcons() {
        txtUsername.addPaddingToImageLeft(26.0, src: "person")
        txtEmailAddress.addPaddingToImageLeft(26.0, src: "mail")
        txtPhoneNumber.addPaddingToImageLeft(26.0, src: "phone")
        txtPassword.addPaddingToImageLeft(26.0, src: "lock")
    }
}
