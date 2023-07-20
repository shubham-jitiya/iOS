//
//  HomePageVC.swift
//  iOS
//
//  Created by Shubham Jitiya on 13/07/23.
//

import UIKit

class HomePageVC: UIViewController {
    
    // MARK: Variables
    var coordinate: HomePageCoordinator?
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - IBActions
extension HomePageVC {
    @IBAction func buttonLogoutTapped(_ sender: UIButton) {
        coordinate?.finishToRootView()
    }
}

