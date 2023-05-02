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
    func userInfo(_ data: UserModel)
}

// MARK: IB actions
extension VCAddContacts {
    @IBAction private func btnUpdateProfileImage() {
        initialiseImagePicker()
    }
    
    @IBAction private func btnSubmit() {
        if let firstName = tfFirstName.text,  let lastName = tfLastName.text, let age  = tfAge.text {
            let data = UserModel(imgProfile: imgProfileImage.image, fName: firstName, lName: lastName, age: age)
            if isValidInfo(data) {
                userData?.userInfo(data)
                print("User data saved successfully!!")
                navigationController?.popViewController(animated: true)
            } else {
              print("Invalid data entered")
            }
        }
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
    
    private func isValidInfo( _ userData: UserModel) -> Bool {
        guard let userFirstName = userData.fName,
              let userLastName = userData.lName,
              let userAge = userData.age else {
            return false
        }
        if userFirstName.count > 2 && userLastName.count > 2 && userAge.count <= 2 {
            let validNumbers = CharacterSet(charactersIn: Constants.validNumbers.rawValue)
            let validCharacters = CharacterSet(charactersIn: Constants.validCharacters.rawValue)
            print("Validation checking")
            return userFirstName.rangeOfCharacter(from: validCharacters.inverted) == nil
            && userLastName.rangeOfCharacter(from: validCharacters.inverted) == nil
            && userAge.rangeOfCharacter(from: validNumbers.inverted) == nil
        } else {
            return false
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
 
}
