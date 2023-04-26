//
//  VCProgressView.swift
//  iOS
//
//  Created by Shubham Jitiya on 26/04/23.
//

import UIKit

class VCProgressView: UIViewController {
    
    // MARK: IB outlets
    @IBOutlet weak var sliderUpdateProgress: UISlider!
    @IBOutlet weak var progressViewTest: UIProgressView!
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        updateProgressView()
    }
}

// MARK: Extension functions
extension VCProgressView {
    private func updateProgressView() {
        progressViewTest.setProgress(0.1, animated: true)
        sliderUpdateProgress.addTarget(self, action: #selector(updateProgressViewBySlider(_:)), for: .valueChanged)       
    }
    
    @objc func updateProgressViewBySlider(_ slider: UISlider) {
        progressViewTest.setProgress(slider.value, animated: true)
    }
}
