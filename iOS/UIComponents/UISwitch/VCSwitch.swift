//
//  VCSwitch.swift
//  iOS
//
//  Created by Shubham Jitiya on 25/04/23.
//

import UIKit

class VCSwitch: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var switchToggle: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(switchToggle.isOn)
        //switchToggle.tintColor = .red
        switchToggle.onTintColor = .red
        switchToggle.thumbTintColor = .black
//        switchToggle.layer.shadowColor = UIColor.red.cgColor
//        switchToggle.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
//        switchToggle.layer.opacity = 0.8
        
    }
}
