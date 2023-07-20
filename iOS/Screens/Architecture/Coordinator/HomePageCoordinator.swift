//
//  File.swift
//  iOS
//
//  Created by Shubham Jitiya on 13/07/23.
//

import UIKit

class HomePageCoordinator: Coordinator {
    
    // MARK: - Variables
    var navigationController: UINavigationController
    
    // MARK: - Initializers
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Functions
    func start() {
        guard let homePageVC = R.storyboard.uiHomePage.homePageVC() else { return }
        homePageVC.coordinate = self
        navigationController.pushViewController(homePageVC, animated: true)
    }
    
    func finish() {
        navigationController.popViewController(animated: true)
    }
    
    func finishToRootView() { navigationController.popToRootViewController(animated: true) }
}
