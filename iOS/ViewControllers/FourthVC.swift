//
//  FourthVC.swift
//  iOS
//
//  Created by Shubham Jitiya on 17/05/23.
//

import UIKit

protocol VCDataPassingDelegate: AnyObject {
    func userInput(text: String)
}

class FourthVC: UIViewController {
    // MARK: Variables
    weak var delegate: VCDataPassingDelegate?
    
    // MARK: IB outlets
    @IBOutlet weak var tfUserInput: UITextField!
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: IB actions
extension FourthVC {
    @IBAction func gotoRootViewController(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction private func gotoSecondViewController(_ sender: UIButton) {
        if let viewControllers = navigationController?.viewControllers {
            for viewController in viewControllers {
                if viewController.isKind(of: SecondVC.self) {
                    let tfData = tfUserInput.text
                    delegate?.userInput(text: tfData ?? "")
                    navigationController?.popToViewController(viewController, animated: true)
                    break
                }
            }
        }
    }
    
    @IBAction private func dismissToPrevious(_ sender: UIButton) {
        presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction private func dismissToSecondVC(_ sender: UIButton) {
        presentingViewController?.presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction private func dismissToRootView(_ sender: UIButton) {
        view.window?.rootViewController?.dismiss(animated: true)
    }
}

