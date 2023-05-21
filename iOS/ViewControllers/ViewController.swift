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
        guard let vcLabel = LabelsVC.create(storyboardName: .uiLabel) as?
                LabelsVC else {
            return
        }
        navigate(to: vcLabel)
    }
    
    @IBAction private func btnButton(_ sender: UIButton) {
        guard let vcButton = ButtonVC.create(storyboardName: .uiButton) as?
                ButtonVC else {
            return
        }
        navigate(to: vcButton)
    }
    
    @IBAction private func btnTextField(_ sender: UIButton) {
        guard let vcTextField = TextFieldVC.create(storyboardName: .uiTextField) as?
                TextFieldVC else {
            return
        }
        navigate(to: vcTextField)
    }
    
    @IBAction private func btnTextView(_ sender: UIButton) {
        guard let vcTextView = TextViewVC.create(storyboardName: .uiTextView) as?
                TextViewVC else {
            return
        }
        navigate(to: vcTextView)
    }
    
    @IBAction private func btnSwitch(_ sender: UIButton) {
        guard let vcSwitch = SwitchVC.create(storyboardName: .uiSwitch) as?
                SwitchVC else {
            return
        }
        navigate(to: vcSwitch)
    }
    
    @IBAction private func btnSlider(_ sender: UIButton) {
        guard let vcSlider = SliderVC
            .create(storyboardName: .uiSlider) as?
                SliderVC else {
            return
        }
        navigate(to: vcSlider)
    }
    
    @IBAction private func btnProgressView(_ sender: UIButton) {
        guard let vcProgressView = ProgressViewVC
            .create(storyboardName: .uiProgressView) as?
                ProgressViewVC else {
            return
        }
        navigate(to: vcProgressView)
    }
    
    @IBAction private func btnSegmentedControl(_ sender: UIButton) {
        guard let vcSegmentedControl = SegmentedControlVC
            .create(storyboardName: .uiSegmentedControl) as?
                SegmentedControlVC else {
            return
        }
        navigate(to: vcSegmentedControl)
    }
    
    @IBAction private func btnPageControl(_ sender: UIButton) {
        guard let vcPageControl = PageControlVC
            .create(storyboardName: .uiPageControl) as?
                PageControlVC else {
            return
        }
        navigate(to: vcPageControl)
    }
    
    @IBAction private func btnStepper(_ sender: UIButton) {
        guard let vcStepper = StepperVC
            .create(storyboardName: .uiStepper) as?
                StepperVC else {
            return
        }
        navigate(to: vcStepper)
    }
    
    @IBAction private func btnScrollView(_ sender: UIButton) {
        guard let vcScrollView = ScrollViewVC
            .create(storyboardName: .uiScrollView) as?
                ScrollViewVC else {
            return
        }
        navigate(to: vcScrollView)
    }
    
    @IBAction private func btnImagePicker(_ sender: UIButton) {
        guard let vcImagePicker = ImagePickerVC
            .create(storyboardName: .uiImagePicker) as?
                ImagePickerVC else {
            return
        }
        navigate(to: vcImagePicker)
    }
    
    @IBAction private func btnTableView(_ sender: UIButton) {
        guard let vcTableView = TableViewVC
            .create(storyboardName: .uiTableView) as?
                TableViewVC else {
            return
        }
        navigate(to: vcTableView)
    }

    @IBAction private func btnTableViewProject(_ sender: UIButton) {
        guard let vcListContacts = ListContactsVC
            .create(storyboardName: .uiListContacts) as?
                ListContactsVC else {
            return
        }
        navigate(to: vcListContacts)
    }
    
    @IBAction private func btnViewLifeCycle(_ sender: UIButton) {
        guard let vcCollectionView = CollectionViewVC
            .create(storyboardName: .uiCollectionView) as?
                CollectionViewVC else {
            return
        }
        navigate(to: vcCollectionView)
    }
    
    @IBAction private func btnCollectionViewBasic(_ sender: UIButton) {
        guard let vcCollectionViewBasic = BasicCollectionViewVC
            .create(storyboardName: .uiCollectionViewBasic) as?
                BasicCollectionViewVC else {
            return
        }
        navigate(to: vcCollectionViewBasic)
    }
    
    @IBAction private func btnCollectionProject(_sender: UIButton) {
        guard let vcCollectionProject = OrangeVC
            .create(storyboardName: .uiOrange) as? OrangeVC else {
            return
        }
        navigate(to: vcCollectionProject)
    }
    
    @IBAction private func btnPullToRefresh(_ sender: UIButton) {
        guard let cvPullToRefresh = PullToRefreshVC
            .create(storyboardName: .uiPullToRefresh) as? PullToRefreshVC else {
            return
        }
        navigate(to: cvPullToRefresh)
    }
    
    @IBAction private func btnImageView(_ sender: UIButton) {
        guard let vcImageView = ImageViewVC
            .create(storyboardName: .uiImageView) as? ImageViewVC else {
            return
        }
        navigate(to: vcImageView)
    }
    
    @IBAction private func btnActivityIndicator(_ sender: UIButton) {
        guard let vcActivityIndicator = ActivityIndicatorVC
            .create(storyboardName: .uiActivityIndicator) as? ActivityIndicatorVC else {
            return
        }
        navigate(to: vcActivityIndicator)
    }
    
    @IBAction private func btnWebView(_ sender: UIButton) {
        guard let vcWebView = WebViewVC
            .create(storyboardName: .uiWebView) as? WebViewVC else {
            return
        }
        navigate(to: vcWebView)
    }
    
    @IBAction private func btnSearchBar(_ sender: UIButton) {
        guard let vcSearchBar = SearchBarVC
            .create(storyboardName: .uiSearchBar) as? SearchBarVC else {
            return
        }
        navigate(to: vcSearchBar)
    }
    
    @IBAction private func btnUIPickerView(_ sender: UIButton) {
        guard let vcPickerView = PickerViewVC
            .create(storyboardName: .uiPickerView) as? PickerViewVC else {
            return
        }
        navigate(to: vcPickerView)
    }
    
    @IBAction private func btnDatePicker(_ sender: UIButton) {
        guard let vcDatePicker = DatePickerVC
            .create(storyboardName: .uiDatePicker) as? DatePickerVC else {
            return
        }
        navigate(to: vcDatePicker)
    }
    
    @IBAction private func btnStackView(_ sender: UIButton) {
        guard let vcStackView = StackViewVC
            .create(storyboardName: .uiStackView) as? StackViewVC else {
            return
        }
        navigate(to: vcStackView)
    }
    
    @IBAction private func btnTabBar(_ sender: UIButton) {
        guard let vcTabBar = TabBarVC.create(storyboardName: .uiTabBar) as? TabBarVC else {
            return
        }
        navigate(to: vcTabBar)
    }
    
    @IBAction private func btnPageViewController(_ sender: UIButton) {
        guard let vcPageViewController = PageViewVC
            .create(storyboardName: .uiPageViewController) as? PageViewVC else {
            return
        }
        navigate(to: vcPageViewController)
    }
    
    @IBAction private func btnUIToolbar(_ sender: UIButton) {
        guard let vcToolbar = ToolbarVC
            .create(storyboardName: .uiToolbar) as? ToolbarVC else {
            return
        }
        navigate(to: vcToolbar)
    }
    
    @IBAction private func btnClLocation(_ sender: UIButton) {
       
    }
    
    @IBAction private func btnMapView(_ sender: UIButton) {
        guard let vcMapView = MapViewVC
            .create(storyboardName: .uiMapView) as? MapViewVC else {
            return
        }
        navigate(to: vcMapView)
    }
}
