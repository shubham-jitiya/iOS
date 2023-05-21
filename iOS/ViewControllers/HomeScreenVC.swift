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
}
