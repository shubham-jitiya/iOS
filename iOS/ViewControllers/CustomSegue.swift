//
//  CustomSegue.swift
//  iOS
//
//  Created by Shubham Jitiya on 18/05/23.
//

import UIKit

class CustomSegue: UIStoryboardSegue {
    override init(identifier: String?, source: UIViewController, destination: UIViewController) {
        super.init(identifier: identifier, source: source, destination: destination)
    }
    
    override func perform() {
        if let firstVCView = source.view, let secondVCView = source.view {
            let screenWidth = UIScreen.main.bounds.width
            let screenHeight = UIScreen.main.bounds.height
            secondVCView.frame = CGRect(x: 0, y: screenHeight, width: screenWidth, height: screenHeight)
            let window = UIApplication.shared.keyWindow
            window?.insertSubview(secondVCView, aboveSubview: firstVCView)
            
            UIView.animate(withDuration: 0.4) {
                firstVCView.frame = firstVCView.frame.offsetBy(dx: 0, dy: -screenHeight)
                secondVCView.frame = secondVCView.frame.offsetBy(dx: 0, dy: -screenHeight)
                
            } completion: { (finish) in
                self.source.present(self.destination, animated: true)
            }
        }
    }
}
