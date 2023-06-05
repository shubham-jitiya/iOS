//
//  UIViewController+Extension.swift
//  iOS
//
//  Created by Shubham Jitiya on 24/04/23.
//

import UIKit

extension UIViewController {
    static func create<T: UIViewController>(storyboardName: Storyboards) -> T? {
        let storyboard = UIStoryboard.init(name: storyboardName.rawValue, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: self)) as? T
    }
    
    func navigate(to viewController: UIViewController, animated: Bool = true) {
        self.navigationController?.pushViewController(viewController, animated: animated)
    }
}
