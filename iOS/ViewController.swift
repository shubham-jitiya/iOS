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
        //print("View will appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       // print("View did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
       // print("View will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
       // print("View did disappear")
    }
}

// MARK: - IB Actions
extension ViewController {
    @IBAction private func btnLabel(_ sender: UIButton) {
        guard let vcLabel = VCLabels.create(storyboardName: .uiLabel) as?
                VCLabels else {
            return
        }
        navigate(to: vcLabel)
    }
    
    @IBAction private func btnButton(_ sender: UIButton) {
        guard let vcButton = VCButton.create(storyboardName: .uiButton) as?
                VCButton else {
            return
        }
        navigate(to: vcButton)
    }
    
    @IBAction private func btnTextField(_ sender: UIButton) {
        guard let vcTextField = VCTextField.create(storyboardName: .uiTextField) as?
                VCTextField else {
            return
        }
        navigate(to: vcTextField)
    }
    
    @IBAction private func btnTextView(_ sender: UIButton) {
        guard let vcTextView = VCTextView.create(storyboardName: .uiTextView) as?
                VCTextView else {
            return
        }
        navigate(to: vcTextView)
    }
    
    @IBAction private func btnSwitch(_ sender: UIButton) {
        guard let vcSwitch = VCSwitch.create(storyboardName: .uiSwitch) as?
                VCSwitch else {
            return
        }
        navigate(to: vcSwitch)
    }
    
    @IBAction private func btnSlider(_ sender: UIButton) {
        guard let vcSlider = VCSlider
            .create(storyboardName: .uiSlider) as?
                VCSlider else {
            return
        }
        navigate(to: vcSlider)
    }
    
    @IBAction private func btnProgressView(_ sender: UIButton) {
        guard let vcProgressView = VCProgressView
            .create(storyboardName: .uiProgressView) as?
                VCProgressView else {
            return
        }
        navigate(to: vcProgressView)
    }
    
    @IBAction private func btnSegmentedControl(_ sender: UIButton) {
        guard let vcSegmentedControl = VCSegmentedControl
            .create(storyboardName: .uiSegmentedControl) as?
                VCSegmentedControl else {
            return
        }
        navigate(to: vcSegmentedControl)
    }
    
    @IBAction private func btnPageControl(_ sender: UIButton) {
        guard let vcPageControl = VCPageControl
            .create(storyboardName: .uiPageControl) as?
                VCPageControl else {
            return
        }
        navigate(to: vcPageControl)
    }
    
    @IBAction private func btnStepper(_ sender: UIButton) {
        guard let vcStepper = VCStepper
            .create(storyboardName: .uiStepper) as?
                VCStepper else {
            return
        }
        navigate(to: vcStepper)
    }
    
    @IBAction private func btnScrollView(_ sender: UIButton) {
        guard let vcScrollView = VCScrollView
            .create(storyboardName: .uiScrollView) as?
                VCScrollView else {
            return
        }
        navigate(to: vcScrollView)
    }
    
    @IBAction private func btnImagePicker(_ sender: UIButton) {
        guard let vcImagePicker = VCImagePicker
            .create(storyboardName: .uiImagePicker) as?
                VCImagePicker else {
            return
        }
        navigate(to: vcImagePicker)
    }
    
    @IBAction private func btnTableView(_ sender: UIButton) {
        guard let vcTableView = VCTableView
            .create(storyboardName: .uiTableView) as?
                VCTableView else {
            return
        }
        navigate(to: vcTableView)
    }

    @IBAction private func btnTableViewProject(_ sender: UIButton) {
        guard let vcListContacts = VCListContacts
            .create(storyboardName: .uiListContacts) as?
                VCListContacts else {
            return
        }
        navigate(to: vcListContacts)
    }
    
    @IBAction private func btnViewLifeCycle(_ sender: UIButton) {
        guard let vcCollectionView = VCCollectionView
            .create(storyboardName: .uiCollectionView) as?
                VCCollectionView else {
            return
        }
        navigate(to: vcCollectionView)
    }
    
    @IBAction private func btnCollectionViewBasic(_ sender: UIButton) {
        guard let vcCollectionViewBasic = VCBasicCollectionView
            .create(storyboardName: .uiCollectionViewBasic) as?
                VCBasicCollectionView else {
            return
        }
        navigate(to: vcCollectionViewBasic)
    }
    
    @IBAction private func btnCollectionProject(_sender: UIButton) {
        guard let vcCollectionProject = VCOrange
            .create(storyboardName: .uiOrange) as? VCOrange else {
            return
        }
        navigate(to: vcCollectionProject)
    }
    
    @IBAction private func btnPullToRefresh(_ sender: UIButton) {
        guard let cvPullToRefresh = VCPullToRefresh
            .create(storyboardName: .uiPullToRefresh) as? VCPullToRefresh else {
            return
        }
        navigate(to: cvPullToRefresh)
    }
    
    @IBAction private func btnImageView(_ sender: UIButton) {
        guard let vcImageView = VCImageView
            .create(storyboardName: .uiImageView) as? VCImageView else {
            return
        }
        navigate(to: vcImageView)
    }
    
    @IBAction private func btnActivityIndicator(_ sender: UIButton) {
        guard let vcActivityIndicator = VCActivityIndicator
            .create(storyboardName: .uiActivityIndicator) as? VCActivityIndicator else {
            return
        }
        navigate(to: vcActivityIndicator)
    }
    
    @IBAction private func btnWebView(_ sender: UIButton) {
        guard let vcWebView = VCWebView
            .create(storyboardName: .uiWebView) as? VCWebView else {
            return
        }
        navigate(to: vcWebView)
    }
    
    @IBAction private func btnSearchBar(_ sender: UIButton) {
        guard let vcSearchBar = VCSearchBar
            .create(storyboardName: .uiSearchBar) as? VCSearchBar else {
            return
        }
        navigate(to: vcSearchBar)
    }
    
    @IBAction private func btnUIPickerView(_ sender: UIButton) {
        guard let vcPickerView = VCPickerView
            .create(storyboardName: .uiPickerView) as? VCPickerView else {
            return
        }
        navigate(to: vcPickerView)
    }
    
    @IBAction private func btnDatePicker(_ sender: UIButton) {
        guard let vcDatePicker = VCDatePicker
            .create(storyboardName: .uiDatePicker) as? VCDatePicker else {
            return
        }
        navigate(to: vcDatePicker)
    }
    
    @IBAction private func btnStackView(_ sender: UIButton) {
        guard let vcStackView = VCStackView
            .create(storyboardName: .uiStackView) as? VCStackView else {
            return
        }
        navigate(to: vcStackView)
    }
    
    @IBAction private func btnTabBar(_ sender: UIButton) {
        guard let vcTabBar = VCTabBar.create(storyboardName: .uiTabBar) as? VCTabBar else {
            return
        }
        navigate(to: vcTabBar)
    }
}

