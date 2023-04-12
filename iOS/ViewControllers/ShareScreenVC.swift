//
//  ShareScreenVC.swift
//  iOS
//
//  Created by Shubham on 06/06/23.
//

import UIKit

class ShareScreenVC: UIViewController {

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
}

// MARK: IB actions
extension ShareScreenVC {
    @IBAction private func btnBackTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}


// MARK: Functions
extension ShareScreenVC {
    private func initialSetup() {
        navigationController?.isNavigationBarHidden = true
    }
}
