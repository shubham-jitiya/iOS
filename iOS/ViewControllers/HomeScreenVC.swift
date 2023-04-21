//
//  VCHomeScreen.swift
//  iOS
//
//  Created by Shubham Jitiya on 11/05/23.
//

import UIKit

class HomeScreenVC: UIViewController {

    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: IB actions
extension HomeScreenVC {
    @IBAction private func navigateSearch(_ sender: UIButton) {
        let vcExplore = UIViewController()
        vcExplore.view.backgroundColor = .red
        navigationController?.pushViewController(vcExplore, animated: true)
    }
    
    @IBAction private func btnAddTabBarTapped(_ sender: UIButton) {
        guard let viewController = UIStoryboard(name: "UITVAutoResizing", bundle: nil).instantiateViewController(withIdentifier: "TVAutoResizingVC") as? TVAutoResizingVC else { return }
        viewController.tabBarItem = UITabBarItem(title: "New", image: UIImage(systemName: "person"), tag: 4)
        if var previousTabBars = tabBarController?.viewControllers {
            previousTabBars.append(viewController)
            tabBarController?.viewControllers = previousTabBars
        }
       
    }
}
