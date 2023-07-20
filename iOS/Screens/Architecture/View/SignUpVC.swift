//
//  SignUpVC.swift
//  iOS
//
//  Created by Shubham Jitiya on 13/07/23.
//

import UIKit

class SignUpVC: UIViewController {
    
    // MARK: - Variables
    var coordinator: SignUpCoordinator?
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - IBActions
extension SignUpVC {
    @IBAction func buttonLoginTapped(_ sender: UIButton) {
        coordinator?.finish()
    }
}
