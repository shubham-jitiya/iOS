//
//  VCPageControl.swift
//  iOS
//
//  Created by Shubham Jitiya on 26/04/23.
//

import UIKit

class VCPageControl: UIViewController {

    // MARK: IB outlets
    @IBOutlet weak var pageControlTest: UIPageControl!
    @IBOutlet weak var lblCountSegment: UILabel!
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialise()
    }
}

// MARK: Extension functions
extension VCPageControl {
    private func initialise() {
        listenPageControl()
        stylePageControl()
    }
    
    private func listenPageControl() {
        pageControlTest.addTarget(self, action: #selector(pageChanged), for: .valueChanged)
    }
    
    @objc func pageChanged(_ pageContoller: UIPageControl) {
        lblCountSegment.text = String(format: "%d", pageContoller.currentPage)
    }
    
    private func stylePageControl() {
        pageControlTest.setIndicatorImage(UIImage(systemName: "square"), forPage: 2)
    }
}
