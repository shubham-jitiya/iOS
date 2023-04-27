//
//  VCScrollView.swift
//  iOS
//
//  Created by Shubham Jitiya on 27/04/23.
//

import UIKit

class VCScrollView: UIViewController {
    // MARK: IB outlets
    @IBOutlet weak var scrollViewTest: UIScrollView!
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialise()
    }
}

// MARK: Functions
extension VCScrollView {
    private func initialise() {
        //scrollViewTest.showsHorizontalScrollIndicator = false
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
        //scrollViewTest.alwaysBounceVertical = true
        scrollViewTest.decelerationRate = .fast
        //scrollViewTest.flashScrollIndicators()
    }
}

// MARK: Delegate methods
extension VCScrollView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //Scroll at specific location & locks scrolling
        //scrollView.contentOffset = CGPointMake(0.0, 174.0)
        //print("Content offset: ", scrollView.contentOffset)
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
