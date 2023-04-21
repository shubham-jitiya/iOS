//
//  VCNavigation.swift
//  iOS
//
//  Created by Shubham Jitiya on 17/05/23.
//

import UIKit

class NavigationVC: UIViewController {
    // MARK: Variables
    var reverseData = ""
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(reverseData)
    }
}

// MARK: IB action
extension NavigationVC {
    @IBAction private func gotoSecondVC(sender: UIButton) {
        
    }
    
    @IBAction private func checkReverseData() {
        print(reverseData)
    }
    
    @IBAction private func navigateToRootView(sender: UIStoryboardSegue) {
        
    }
    
    @IBAction private func gotoSecondVC(_ sender: UIButton) {
        
    }
    
    @IBAction private func pushMultipleViewControllers(_ sender: UIButton) {
        guard let secondVC = UIStoryboard(name: "UINavigation", bundle: nil)
            .instantiateViewController(withIdentifier: "SecondVC") as? SecondVC,
              let thirdVC = UIStoryboard(name: "UINavigation", bundle: nil)
            .instantiateViewController(withIdentifier: "ThirdVC") as? ThirdVC,
              let fourthVC = UIStoryboard(name: "UINavigation", bundle: nil)
            .instantiateViewController(withIdentifier: "FourthVC") as? FourthVC else {
            return
        }
        let viewControllers = [secondVC, thirdVC, fourthVC]
        var previousViewControllers = navigationController?.viewControllers ?? []
        previousViewControllers.append(contentsOf: viewControllers)
        navigationController?.setViewControllers(previousViewControllers, animated: true)
        guard let navigateToD = navigationController?.viewControllers.first(where: { $0 is FourthVC }) else {
            return
        }
        navigationController?.popToViewController(navigateToD, animated: true)
    }
    
    @IBAction private func presentSpecificViewControllers(_ sender: UIButton) {
        guard let secondVC = UIStoryboard(name: "UINavigation", bundle: nil)
            .instantiateViewController(withIdentifier: "SecondVC") as? SecondVC else {
            return
        }
        navigationController?.present(secondVC, animated: true)
    }
}

// MARK: Functions
extension NavigationVC {
    // Forward data passing
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoSecondVC" {
            if let destination = segue.destination as? SecondVC {
                destination.data = "Some data passed from vc First"
            }
        }
    }
    
    private func initialSetup() {
        navigationController?.navigationBar.isTranslucent = true
        
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.black,
            .underlineColor: UIColor.gray,
            .underlineStyle: NSUnderlineStyle.single.rawValue,
            .font: UIFont.boldSystemFont(ofSize: 22)
        ]
        navigationController?.title = "Test"
        navigationController?.navigationBar.titleTextAttributes = titleAttributes
        navigationController?.navigationItem.title = "Second view controller"
        navigationItem.backButtonTitle = "Back btn"
        navigationItem.title = "Test title"
        UINavigationBar.appearance().backgroundColor = .red
    }
}
