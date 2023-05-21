//
//  VCAddContacts.swift
//  iOS
//
//  Created by Shubham Jitiya on 01/05/23.
//

import UIKit

// MARK: Protocol delegate
protocol UserDataDelegate: AnyObject {
    func userInfo(_ data: UserModel)
}

class AddContactsVC: UIViewController {
    
    // MARK: Variables
    private var userInfo: UserModel = UserModel()
    weak var userDataDelegate: UserDataDelegate?
    
    // MARK: IB outlets
    @IBOutlet private weak var imgProfileImage: UIImageView!
    @IBOutlet private weak var tfFirstName: UITextField!
    @IBOutlet private weak var tfLastName: UITextField!
    @IBOutlet private weak var tfAge: UITextField!
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialiseTextfields()
    }
}

// MARK: IB actions
extension AddContactsVC {
    @IBAction private func btnUpdateProfileImage() {
        setupImagePickerController()
    }
    
    @IBAction private func btnSubmit() {
        guard let firstName = tfFirstName.text, let lastName = tfLastName.text, let age = tfAge.text else {
            return
        }
        let data = UserModel(imgProfile: imgProfileImage.image, fName: firstName, lName: lastName, age: age)
        if isValidInfo(data) {
            userDataDelegate?.userInfo(data)
            print("User data saved successfully!!")
            navigationController?.popViewController(animated: true)
        } else {
            print("Invalid data entered")
        }
    }
}

// MARK: Functions
extension AddContactsVC {
    private func setupImagePickerController() {
        let alertController = UIAlertController(
            title: nil,
            message: nil,
            preferredStyle: .actionSheet
        )
        let actionCamera = UIAlertAction(
            title: Constants.StringConstants.alertActionCamera.rawValue,
            style: .default
        ) { _ in
            print("Camera opened")
        }
        let actionLibrary = UIAlertAction(
            title: Constants.StringConstants.alertActionLibrary.rawValue,
            style: .default
        ) { _ in
            print("Opening libarary")
            self.getImage(sourceType: .photoLibrary)
        }
        let actionCancel = UIAlertAction(
            title: Constants.StringConstants.alertActionCancel.rawValue,
            style: .cancel
        )
        alertController.addAction(actionCamera)
        alertController.addAction(actionLibrary)
        alertController.addAction(actionCancel)
        present(alertController, animated: true)
        imgProfileImage.layer.cornerRadius = imgProfileImage.frame.size.height / 2
    }
    
    private func getImage(sourceType: UIImagePickerController.SourceType) {
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
        tfFirstName.addKeyboardBtnDone()
        tfLastName.addKeyboardBtnDone()
        tfAge.addKeyboardBtnDone()
    }
    
    private func isValidInfo( _ userData: UserModel) -> Bool {
        let validCharacters = CharacterSet(
            charactersIn: Constants.StringConstants.validationAlphabets.rawValue
        )
        let validNumbers = CharacterSet(charactersIn: Constants.StringConstants.validationNumbers.rawValue)
        guard let userFirstName = userData.fName,
              let userLastName = userData.lName,
              let userAge = userData.age else {
            return false
        }
        if userFirstName.count > 2 && userLastName.count > 2 && userAge.count <= 2 && Int(userAge) != 0 {
            return userFirstName.rangeOfCharacter(from: validCharacters.inverted) == nil
            && userLastName.rangeOfCharacter(from: validCharacters.inverted) == nil
            && userAge.rangeOfCharacter(from: validNumbers.inverted) == nil
        } else {
            return false
        }
    }
}

// MARK: Delegation
extension AddContactsVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let isSelected = info[.editedImage] as? UIImage {
                imgProfileImage.image = isSelected
                userInfo.imgProfile = isSelected
            } else {
                imgProfileImage.image = UIImage(systemName: Constants.Images.personCircleFilled.rawValue)
                userInfo.imgProfile = UIImage(systemName: Constants.Images.personCircleFilled.rawValue)
            }
            picker.dismiss(animated: true)
        }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}
