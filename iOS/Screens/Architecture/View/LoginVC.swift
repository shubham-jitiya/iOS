//
//  LoginViewController.swift
//  iOS
//
//  Created by Shubham Jitiya on 13/07/23.
//

import UIKit

class LoginVC: UIViewController {
    
    // MARK: - Variables
    var coordinator: LoginCoordinator?
    private var usernameLiveData = LiveData<String>("username")
    
    // MARK: - Outlets
    @IBOutlet private weak var textFieldUsername: UITextField!
    @IBOutlet weak var labelUsername: UILabel!
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameLiveData.addObserver { [weak self] userName in
            guard let self else { return }
            self.labelUsername.text = "Hello, \(userName)!"
        }
    }
}

// MARK: - IBActions
extension LoginVC {
    @IBAction func buttonLoginTapped(_ sender: UIButton) {
        coordinator?.goToHomePage()
    }
    
    @IBAction func buttonSignUpTapped(_ sender: UIButton) {
        coordinator?.goToRegisterPage()
    }
}

// MARK: - Textfield delegate
extension LoginVC: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if let userName = textField.text {
            usernameLiveData.value = userName
        }
    }
}
