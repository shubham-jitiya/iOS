//
//  VCSlider.swift
//  iOS
//
//  Created by Shubham Jitiya on 26/04/23.
//

import UIKit

class SliderVC: UIViewController {
    // MARK: IB outlets
    @IBOutlet weak var sliderTest: UISlider!
    @IBOutlet weak var lblVolume: UILabel!
    @IBOutlet weak var lblMinValue: UILabel!
    @IBOutlet weak var lblMaxValue: UILabel!
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        properties()
    }
}

// MARK: Extension functions
extension SliderVC {
    private func properties(){
        minMaxValue()
        updateThumb()
        sliderTest.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
    }
    
    private func minMaxValue() {
        sliderTest.value = 1
        lblVolume.text = String(format: "Volume: %f", sliderTest.value)
        lblMinValue.text = String(format: "%0.2f", sliderTest.minimumValue)
        lblMaxValue.text = String(format: "%0.2f", sliderTest.maximumValue)
        sliderTest.maximumValueImage = UIImage(systemName: "speaker.wave.2")
        sliderTest.minimumValueImage = UIImage(systemName: "speaker")
        sliderTest.minimumTrackTintColor = UIColor.init(red: 0.0, green: 0.0, blue: 0.9, alpha: 1.0)
        sliderTest.maximumTrackTintColor = UIColor.init(red: 0.0, green: 0.0, blue: 0.5, alpha: 0.2)
    }
    
    private func updateThumb() {
        sliderTest.thumbTintColor = UIColor.red
        sliderTest.setThumbImage(UIImage(systemName: "music.note"), for: .highlighted)
    }
    
    @objc func sliderValueChanged(_ sender: UISlider) {
        let roundedSteppedValue = round(sender.value / 0.5) * 0.5
        sender.value = roundedSteppedValue
        lblVolume.text = String(format: "Volume: %.1f", sender.value)
    }
}
