//
//  SecondVC.swift
//  iOS
//
//  Created by Shubham Jitiya on 17/05/23.
//

import UIKit

class SecondVC: UIViewController {
    // MARK: Variables
    var data = ""
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
}

// MARK: IB actions
extension SecondVC {
    @IBAction private func unwindToSecondVC(sender: UIStoryboardSegue) {
        
    }
    
    @IBAction private func dataPassingReverse(_ sender: UIButton) {
        if let previousVC = presentingViewController as? NavigationVC {
            previousVC.reverseData = "Reverse data passed"
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction private func addViewControllers(_ sender: UIButton) {
        var previousViewControllers = navigationController?.viewControllers ?? []
        guard let thirdVC = UIStoryboard(name: "UINavigation", bundle: nil)
            .instantiateViewController(withIdentifier: "ThirdVC") as? ThirdVC,
              let fourthVC = UIStoryboard(name: "UINavigation", bundle: nil)
            .instantiateViewController(withIdentifier: "FourthVC") as? FourthVC else {
            return
        }
        fourthVC.delegate = self
        let newViewControllers = [thirdVC, fourthVC]
        previousViewControllers.append(contentsOf: newViewControllers)
        navigationController?.setViewControllers(previousViewControllers, animated: true)
        guard let lastVC = previousViewControllers.last else {
            return
        }
        navigationController?.popToViewController(lastVC, animated: true)
    }
    
    @IBAction private func presentThird(_ sender: UIButton) {
        guard let thirdVC = UIStoryboard(name: "UINavigation", bundle: nil)
            .instantiateViewController(withIdentifier: "ThirdVC") as? ThirdVC else {
            return
        }
        present(thirdVC, animated: true)
    }
}

// MARK: Functions
extension SecondVC {
    func initialSetup(){
        navigationController?.delegate = self
        print(data)
    }
}

// MARK: Delegate - Navigation controller
extension SecondVC: UINavigationControllerDelegate {
    func navigationController(
        _ navigationController: UINavigationController,
        willShow viewController: UIViewController, animated: Bool) {
        print("Will show")
            
    }
    
    func navigationController(
        _ navigationController: UINavigationController,
        didShow viewController: UIViewController,
        animated: Bool) {
        print("Did show")
    }
}

// MARK: Delegate - user input
extension SecondVC: VCDataPassingDelegate {
    func userInput(text: String) {
        print(text)
    }
}
