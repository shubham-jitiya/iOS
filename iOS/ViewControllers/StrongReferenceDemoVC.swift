//
//  StrongReferenceDemoVC.swift
//  iOS
//
//  Created by Shubham on 03/06/23.
//

import UIKit

class StrongReferenceDemoVC: UIViewController {

    // MARK: Variables
    var captureSelf: (() -> (Void))?
    
    // MARK: IB outlets
    @IBOutlet private weak var btnAnimate: UIButton!
    @IBOutlet private weak var btnShow: UIButton!
    @IBOutlet private weak var btnHide: UIButton!
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    deinit {
        print("Deinit called")
    }
}

// MARK: IB actions
extension StrongReferenceDemoVC {
    @IBAction private func btnShowTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 1) {
            guard let animate = self.captureSelf else {
                return
            }
            animate()
        }
    }
    
    @IBAction private func btnHideTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 1) {
            self.btnAnimate.alpha = 0
        }
    }
}

// MARK: Functions
extension StrongReferenceDemoVC {
    private func initialSetup() {
        // capturing self strongly
        captureSelf = {
            self.btnAnimate.alpha = 1
        }
        // capturing self weakly
//        captureSelf = { [weak self] in
//            guard let self else { return }
//            self.btnAnimate.alpha = 1
//        }
    }
}
