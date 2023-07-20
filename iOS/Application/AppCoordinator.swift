//
//  AppCoordinator.swift
//  iOS
//
//  Created by Shubham Jitiya on 13/07/23.
//

import UIKit

class AppCoordinator: Coordinator  {
    
    // MARK: - Variables
    var navigationController: UINavigationController
    
    // MARK: - Initializer
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        setupNavigation()
    }
    
    // MARK: - Functions
    func setupNavigation() { }
    
    func start() {
        goToMainScreen()
    }
    
    func finish() { }
    
    func finishToRootView() { }
}

// MARK: - Functions
extension AppCoordinator {    
    func goToMainScreen() {
        let mainScreenCoordinator = MainScreenCoordinator(navigationController: navigationController)
        mainScreenCoordinator.start()
    }
    
    func goToLogin() {
        let loginCoordinator = LoginCoordinator(navigationController: navigationController)
        loginCoordinator.start()
    }
}
