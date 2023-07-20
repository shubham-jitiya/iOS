//
//  LoginCoordinator.swift
//  iOS
//
//  Created by Shubham Jitiya on 13/07/23.
//

import UIKit

class LoginCoordinator: Coordinator {
    
    // MARK: - Variables
    var navigationController: UINavigationController
    
    // MARK: - Initializer
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        setupNavigation()
    }
    
    // MARK: - Functions
    func start() {
        guard let loginVC = R.storyboard.uiLogin.loginVC() else {
            return
        }
        loginVC.coordinator = self
        navigationController.pushViewController(loginVC, animated: true)
    }
    
    func finish() {
        navigationController.popViewController(animated: true)
    }
    
    func finishToRootView() { navigationController.popToRootViewController(animated: true) }
    
    func setupNavigation() {
        let backButton = UIBarButtonItem()
        backButton.title = "Home"
            navigationController.navigationBar.topItem?.backBarButtonItem = backButton
    }
}

// MARK: - Extension functions
extension LoginCoordinator {
    func goToRegisterPage() {
        let signUpCoordinator = SignUpCoordinator(navigationController: navigationController)
        signUpCoordinator.start()
    }
    
    func goToHomePage() {
        let homePageCoordinator = HomePageCoordinator(navigationController: navigationController)
        homePageCoordinator.start()
    }
}
