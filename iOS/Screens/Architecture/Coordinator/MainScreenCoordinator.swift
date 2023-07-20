//
//  MainScreenCoordinator.swift
//  iOS
//
//  Created by Shubham Jitiya on 19/07/23.
//

import UIKit

class MainScreenCoordinator: Coordinator {
    
    // MARK: - Variables
    var navigationController: UINavigationController
    
    // MARK: - Initializers
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Functions
    func start() {
        guard let mainScreenVC = R.storyboard.main.viewController() else { return }
        mainScreenVC.coordinate = self
        navigationController.pushViewController(mainScreenVC, animated: true)
    }
    
    func finish() {
        navigationController.popViewController(animated: true)
    }
    
    func finishToRootView() { navigationController.popToRootViewController(animated: true) }
}
