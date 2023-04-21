//
//  ThirdVC.swift
//  iOS
//
//  Created by Shubham Jitiya on 17/05/23.
//

import UIKit

class ThirdVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: Functions
extension ThirdVC {
    @IBAction private func presentFourth(_ sender: UIButton) {
        guard let fourthVC = UIStoryboard(name: "UINavigation", bundle: nil)
            .instantiateViewController(withIdentifier: "FourthVC") as? FourthVC else {
            return
        }
        present(fourthVC, animated: true)
    }
}
