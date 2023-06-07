//
//  SpotifyVC.swift
//  iOS
//
//  Created by Shubham on 06/06/23.
//

import UIKit

class SpotifyVC: UIViewController {

    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        
    }
}

// MARK: IB actions
extension SpotifyVC {
    private func initialSetup() {
        navigationController?.isNavigationBarHidden = false
    }
}
