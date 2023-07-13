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
    // children coordinator
    
    // MARK: - Initializer
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        setupNavigation()
    }
    
    // MARK: - Functions
    func setupNavigation() {
        // navigationController.navigationBar.isHidden = true
    }
    
    func start() {
        // handle initial screen to show based upon user is loggedin or not
       goToLogin()
    }
    
    func finish() { }
    
    func finishToRootView() { }
    
    deinit {
        print("App coordinator deinit")
    }
}

// MARK: - Functions
extension AppCoordinator {
    func goToLogin() {
        let loginCoordinator = LoginCoordinator(navigationController: navigationController)
        loginCoordinator.start()
    }
}
