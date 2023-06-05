//
//  VCActivityIndicator.swift
//  iOS
//
//  Created by Shubham Jitiya on 10/05/23.
//

import UIKit

class ActivityIndicatorVC: UIViewController {
    // MARK: IB outlets
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
}

// MARK: IB actions
extension ActivityIndicatorVC {
    @IBAction private func btnStart(_ sender: UIButton) {
        activityIndicator.startAnimating()
    }
    
    @IBAction private func btnStop(_ sender: UIButton) {
        activityIndicator.stopAnimating()
    }
}

// MARK: Functions
extension ActivityIndicatorVC {
    private func initialSetup() {
        activityIndicator.hidesWhenStopped = true
    }
}
