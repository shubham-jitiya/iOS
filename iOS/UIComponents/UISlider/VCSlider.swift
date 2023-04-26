//
//  VCSlider.swift
//  iOS
//
//  Created by Shubham Jitiya on 26/04/23.
//

import UIKit

class VCSlider: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var sliderTest: UISlider!
    @IBOutlet weak var lblVolume: UILabel!
    @IBOutlet weak var lblMinValue: UILabel!
    @IBOutlet weak var lblMaxValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        properties()
    }
}

// MARK: Functions
extension VCSlider {
    private func properties(){
        minMaxValue()
        updateThumb()
        sliderTest.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        //sliderTest.isContinuous = true
    }
    
    private func minMaxValue() {
        sliderTest.value = 1
        lblVolume.text = String(format: "Volume: %f", sliderTest.value)
        lblMinValue.text = String(format: "%0.2f", sliderTest.minimumValue)
        lblMaxValue.text = String(format: "%0.2f", sliderTest.maximumValue)
        sliderTest.maximumValueImage = UIImage.strokedCheckmark
        sliderTest.minimumValueImage = UIImage.remove
        sliderTest.minimumTrackTintColor = UIColor.red
        sliderTest.maximumTrackTintColor = UIColor.orange
    }
    private func updateThumb() {
        sliderTest.thumbTintColor = UIColor.red
        sliderTest.setThumbImage(UIImage(systemName: "music.note"), for: .highlighted)
    }
    
    @objc func sliderValueChanged(_ sender: UISlider) {
        lblVolume.text = String(format: "Volume: %f", sender.value)
    }
}
