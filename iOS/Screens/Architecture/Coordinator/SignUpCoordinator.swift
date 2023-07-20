//
//  SignUpCoordinator.swift
//  iOS
//
//  Created by Shubham Jitiya on 13/07/23.
//

import UIKit

class SignUpCoordinator: Coordinator {
    
    // MARK: - Variables
    var navigationController: UINavigationController
    
    // MARK: - Initializer
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Functions
    func start() {
        guard let signUpVC = R.storyboard.uiSignUp.signUpVC() else {
            return
        }
        signUpVC.coordinator = self
        navigationController.pushViewController(signUpVC, animated: true)
    }
    
    func finish() {
        navigationController.popViewController(animated: true)
    }
    
    func finishToRootView() { navigationController.popToRootViewController(animated: true) }
}

// MARK: - Extension functions
extension SignUpCoordinator {
    func goToLogin() {
        let coordinator = LoginCoordinator(navigationController: navigationController)
        coordinator.start()
    }
}
