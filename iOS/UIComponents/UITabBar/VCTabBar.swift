//
//  VCTabBar.swift
//  iOS
//
//  Created by Shubham Jitiya on 11/05/23.
//

import UIKit

class VCTabBar: UITabBarController {
    // MARK: IB outlets
    
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
}

// MARK: Functions
extension VCTabBar {
    private func initialSetup() {
        self.delegate = self
        setupGestureRecognisers()
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func setupGestureRecognisers() {
        var swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(recogniseSwipeGestures))
        swipeGesture.direction = .left
        view.addGestureRecognizer(swipeGesture)
        swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(recogniseSwipeGestures))
        swipeGesture.direction = .right
        view.addGestureRecognizer(swipeGesture)
    }
    
    @objc private func recogniseSwipeGestures(swipe: UISwipeGestureRecognizer) {
        print("selected index: ", selectedIndex)
        switch swipe.direction {
        case .left:
            if selectedIndex < viewControllers?.count ?? 0 {
                selectedIndex += 1
            }
            break
        case .right:
            if selectedIndex > 0 {
                selectedIndex -= 1
            }
            break
        default:
            break
        }
    }
}

// MARK: Tabbar delegate methods
extension VCTabBar: UITabBarControllerDelegate {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("User selects tab")
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        guard let fromView = selectedViewController?.view, let toView = viewController.view else {
            return false // Make sure you want this as false
        }
        print("From view: \(selectedViewController?.title ?? "") | to View: \(viewController.title ?? "")")
        if fromView != toView {
            UIView.transition(from: fromView, to: toView, duration: 0.8, options: [.transitionCurlUp], completion: nil)
        }
        print("Should select")
        return true
    }
}
