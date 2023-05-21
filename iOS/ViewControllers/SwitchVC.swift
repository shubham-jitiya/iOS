//
//  VCSwitch.swift
//  iOS
//
//  Created by Shubham Jitiya on 25/04/23.
//

import UIKit

class SwitchVC: UIViewController {
    //MARK: outlets
    @IBOutlet weak var switchToggle: UISwitch!
    @IBOutlet weak var lblToggleStatus: UILabel!
    
    //MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    // MARK: IB actions
    @IBAction func toggleSwitch(_ sender: UISwitch) {
        lblToggleStatus.text = sender.isOn ? "ON" : "OFF"
    }
}

// MARK: Extension function
extension SwitchVC {
    // Initialisation
    private func initialSetup() {
        switchProperties()
        switchMethods()
    }
    
    private func switchProperties() {
        printLog()
        toggleSwitchColor()
    }
    
    private func switchMethods() {
        toggleSwitch()
    }
    
    // Log
    private func printLog() {
        print("Is on: ", switchToggle.isOn)
        print("Is selected: ", switchToggle.isSelected)
        print("Is enabled: ", switchToggle.isEnabled)
    }
    
    // Properties
    private func toggleSwitchColor() {
        switchToggle.backgroundColor = .black //color for off state
        switchToggle.layer.cornerRadius = switchToggle.frame.height / 2.0
        switchToggle.onTintColor = .red //color for on state
        switchToggle.thumbTintColor = .white
    }
    
    private func switchShadow() {
        switchToggle.layer.shadowColor = UIColor.red.cgColor
        switchToggle.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        switchToggle.layer.opacity = 0.8
    }
    
    // Methods
    private func toggleSwitch() {
        switchToggle.setOn(true, animated: true)
        switchToggle.isOn = false
        printLog()
    }
}
