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
    
    @IBAction func btnSlider(_ sender: UIButton) {
        guard let vcSlider = VCSlider.create(storyboardName: .uiSlider) as? VCSlider else {
            return
        }
        navigate(to: vcSlider)
    }
    
    @IBAction func btnProgressView(_ sender: UIButton) {
        guard let vcProgressView = VCProgressView.create(storyboardName: .uiProgressView) as? VCProgressView else {
            return
        }
        navigate(to: vcProgressView)
    }
    
    @IBAction func btnSegmentedControl(_ sender: UIButton) {
        guard let vcSegmentedControl = VCSegmentedControl.create(storyboardName: .uiSegmentedControl) as? VCSegmentedControl else {
            return
        }
        navigate(to: vcSegmentedControl)
    }
    
    @IBAction func btnPageControl(_ sender: UIButton) {
        guard let vcPageControl = VCPageControl.create(storyboardName: .uiPageControl) as? VCPageControl else {
            return
        }
        navigate(to: vcPageControl)
    }
    
    @IBAction func btnStepper(_ sender: UIButton) {
        guard let vcStepper = VCStepper.create(storyboardName: .uiStepper) as? VCStepper else {
            return
        }
        navigate(to: vcStepper)
    }
}

