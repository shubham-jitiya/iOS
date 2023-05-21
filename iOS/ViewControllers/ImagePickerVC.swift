//
//  VCImagePicker.swift
//  iOS
//
//  Created by Shubham Jitiya on 27/04/23.
//

import UIKit

class ImagePickerVC: UIViewController {
    // MARK: IB outlets
    @IBOutlet weak var imgUpdateProfile: UIImageView!
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        imgUpdateProfile.layer.cornerRadius = imgUpdateProfile.frame.size.height / 2.0
    }
}

// MARK: IB actions
extension ImagePickerVC {
    @IBAction private func updateProfileImage() {
        initialiseAlertController()
    }
}

// MARK: Functions
extension ImagePickerVC {
    private func initialiseAlertController() {
        let alertController = UIAlertController(
            title: nil,
            message: nil,
            preferredStyle: .actionSheet
        )
        let btnCamera = UIAlertAction(title: Constants.StringConstants.alertActionCamera.rawValue, style: .default){
            [weak self] (_) in
            self?.showImagePicker(selectedSource: .camera)
        }
        let btnGallery = UIAlertAction(title: Constants.StringConstants.alertActionLibrary.rawValue, style: .default) {
            [weak self] (_) in
            self?.showImagePicker(selectedSource: .photoLibrary)
        }
        let btnCancel = UIAlertAction(title: Constants.StringConstants.alertActionCancel.rawValue, style: .cancel, handler: nil)
        alertController.addAction(btnCamera)
        alertController.addAction(btnGallery)
        alertController.addAction(btnCancel)
        present(alertController, animated: true, completion: nil)
    }
    
    private func showImagePicker(selectedSource: UIImagePickerController.SourceType) {
        guard UIImagePickerController.isSourceTypeAvailable(selectedSource) else {
            return
        }
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = selectedSource
        self.present(imagePickerController, animated: true)
    }
}

// MARK: Delegate methods
extension ImagePickerVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
    ) {
        if let selectedImage = info[.originalImage] as? UIImage {
            imgUpdateProfile.image = selectedImage
        } else {
            print("Something went wrong")
        }
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}
