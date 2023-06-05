//
//  VCProgressView.swift
//  iOS
//
//  Created by Shubham Jitiya on 26/04/23.
//

import UIKit

class ProgressViewVC: UIViewController {
    
    // MARK: IB outlets
    @IBOutlet private weak var sliderUpdateProgress: UISlider!
    @IBOutlet private weak var progressViewTest: UIProgressView!
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        updateProgressView()
    }
}

// MARK: Extension functions
extension ProgressViewVC {
    private func updateProgressView() {
        progressViewTest.setProgress(0.1, animated: true)
        sliderUpdateProgress.addTarget(self, action: #selector(updateProgressViewBySlider(_:)), for: .valueChanged)       
    }
    
    @objc func updateProgressViewBySlider(_ slider: UISlider) {
        progressViewTest.setProgress(slider.value, animated: true)
    }
}
