//
//  VCScrollView.swift
//  iOS
//
//  Created by Shubham Jitiya on 27/04/23.
//

import UIKit

class ScrollViewVC: UIViewController {
    // MARK: IB outlets
    @IBOutlet weak var scrollViewTest: UIScrollView!
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialise()
    }
}

// MARK: Functions
extension ScrollViewVC {
    private func initialise() {
        scrollViewTest.isPagingEnabled = true
        scrollViewTest.bounces = true
        scrollViewTest.contentInset = UIEdgeInsets(
            top: 0,
            left: 16,
            bottom: 0,
            right: 16
        )
        scrollViewTest.scrollIndicatorInsets = UIEdgeInsets(
            top: 0,
            left: 16,
            bottom: 0,
            right: 16
        )
        scrollViewTest.decelerationRate = .fast
    }
}

// MARK: Delegate methods
extension ScrollViewVC: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("Did scroll")
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print("Begin dragging")
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("End dragging")
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        print("Begin decelarating")
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("End decelarating")
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        print("Did zoom")
    }
}
