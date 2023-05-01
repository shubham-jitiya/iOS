//
//  VCAddContacts.swift
//  iOS
//
//  Created by Shubham Jitiya on 01/05/23.
//

import UIKit

class VCAddContacts: UIViewController {
    // MARK: Variables
    private var userInfo: UserModel = UserModel()
    weak var userData: UserDataDelegate?

    // MARK: IB outlets
    @IBOutlet weak var imgProfileImage: UIImageView!
    @IBOutlet weak var tfFirstName: UITextField!
    @IBOutlet weak var tfLastName: UITextField!
    @IBOutlet weak var tfAge: UITextField!
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialiseTextfields()
    }
    override func viewDidAppear(_ animated: Bool) {
        tfFirstName.becomeFirstResponder()
    }
}

// MARK: Protocol delegate
protocol UserDataDelegate: AnyObject {
    func userInfo(data: UserModel)
}

// MARK: IB actions
extension VCAddContacts {
    @IBAction private func btnUpdateProfileImage() {
        initialiseImagePicker()
    }
    @IBAction private func btnSubmit() {
        //addDummyData()
        //print(userData)
        userData?.userInfo(data: userInfo)
        print("User data saved successfully!!")
    }
}

// MARK: Functions
extension VCAddContacts {
    private func initialiseImagePicker() {
        let alertController = UIAlertController(
            title: nil,
            message: nil,
            preferredStyle: .actionSheet
        )
        let actionCamera = UIAlertAction(
            title: "Camera",
            style: .default
        ) { _ in
            print("Camera opened")
        }
        let actionLibrary = UIAlertAction(
            title: "Library",
            style: .default
        ) { _ in
            print("Opening libarary")
            self.updateImage(sourceType: .photoLibrary)
        }
        let actionCancel = UIAlertAction(
            title: "Cancel",
            style: .cancel
        )
        alertController.addAction(actionCamera)
        alertController.addAction(actionLibrary)
        alertController.addAction(actionCancel)
        present(alertController, animated: true)
        imgProfileImage.layer.cornerRadius = imgProfileImage.frame.size.height / 2
    }
    
    private func updateImage(sourceType: UIImagePickerController.SourceType) {
        guard UIImagePickerController.isSourceTypeAvailable(sourceType) else {
            return
        }
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = sourceType
        present(imagePickerController, animated: true)
    }
    
    private func initialiseTextfields() {
        tfFirstName.keyboardBtnDone()
        tfLastName.keyboardBtnDone()
        tfAge.keyboardBtnDone()
    }
    
    private func saveUserInfo(_ textField: UITextField) {
        switch textField {
        case tfFirstName:
            userInfo.fName = tfFirstName.text ?? "NA"
        case tfLastName:
            userInfo.lName = tfLastName.text ?? "NA"
        case tfAge:
            userInfo.age = tfAge.text ?? "NA"
        default:
            print("Something went wrong while submiting data")
        }
        print("User info saved")
    }
    
    private func validateUserInfo(_ textField: UITextField, _ userInput: String) {
        switch textField {
        case tfFirstName :
            if userInput.count < 2 {
                print("First name must be greater than 2")
            }
        case tfLastName:
            if userInput.count < 2 {
                print("Last name must be greater than 2")
            }
        case tfAge:
            if userInput.count > 2 {
                print("Age should be less than 100")
            }
        default: print(" ")
        }
    }
}

// MARK: Delegation
extension VCAddContacts: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let isSelected = info[.editedImage] as? UIImage {
            imgProfileImage.image = isSelected
            userInfo.imgProfile = isSelected
        } else {
            imgProfileImage.image = UIImage(systemName: "person.crop.circle.fill")
            userInfo.imgProfile = UIImage(systemName: "person.crop.circle.fill")
        }
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}

extension VCAddContacts: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let userInput = textField.text else {
            return
        }
        validateUserInfo(textField, userInput)
        saveUserInfo(textField)
    }
}
