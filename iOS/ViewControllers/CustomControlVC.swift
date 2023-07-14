//
//  CustomControlVC.swift
//  iOS
//
//  Created by Shubham Jitiya on 14/07/23.
//

import UIKit

class CustomControlVC: UIViewController {

    // MARK: - Outlets
    @IBOutlet private weak var textFieldPassword: CustomTextField!
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()        
    }
}

extension CustomControlVC: DesignableTextFieldDelegate {
    func textFieldIconClicked(btn: UIButton) {
        print("Toggle password")
    }
}
