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

    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: IBActions
extension LoginVC {
    @IBAction func buttonLoginTapped(_ sender: UIButton) {
        coordinator?.goToHomePage()
    }
    
    @IBAction func buttonSignUpTapped(_ sender: UIButton) {
        coordinator?.goToRegisterPage()
    }
}
