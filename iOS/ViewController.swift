//
//  ViewController.swift
//  iOS
//
//  Created by Shubham Jitiya on 12/04/23.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - View life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        //        lblWelcome.text = "View did load"
        //        btnOne.layer.cornerRadius = 16
        //        btnOne.clipsToBounds = true
        //        btnOne.setTitle("BtnOne", for: .normal)
        //        lblName.layer.borderColor = UIColor.blue.cgColor
        //        lblName.layer.borderWidth = 1
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("View will appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("View did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("View will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("View did disappear")
    }
    
    //MARK: - IB Actions
    @IBAction func btnLabel(_ sender: UIButton) {
        guard let vcLabel = VCLabels.create(storyboardName: .uiLabel) as? VCLabels else {
            return
        }
        navigate(to: vcLabel)
    }
    
    @IBAction func btnButton(_ sender: UIButton) {
        guard let vcButton = VCButton.create(storyboardName: .uiButton) as? VCButton else {
            return
        }
        navigate(to: vcButton)
    }
    
    @IBAction func btnTextField(_ sender: UIButton) {
        guard let vcTextField = VCTextField.create(storyboardName: .uiTextField) as? VCTextField else {
            return
        }
        navigate(to: vcTextField)
    }
    
    @IBAction func btnTextView(_ sender: UIButton) {
        guard let vcTextView = VCTextView.create(storyboardName: .uiTextView) as? VCTextView else {
            return
        }
        navigate(to: vcTextView)
    }
    
    @IBAction func btnSwitch(_ sender: UIButton) {
        guard let vcSwitch = VCSwitch.create(storyboardName: .uiSwitch) as? VCSwitch else {
            return
        }
        navigate(to: vcSwitch)
    }
}

