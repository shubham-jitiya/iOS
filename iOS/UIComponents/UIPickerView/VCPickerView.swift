//
//  VCPickerView.swift
//  iOS
//
//  Created by Shubham Jitiya on 10/05/23.
//

import UIKit

class VCPickerView: UIViewController {
    // MARK: Variables
    private let weekdays = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    private let month = ["Jan", "Feb", "March", "Apr", "May", "Jun", "Jul", "Aug", "Sept", "Oct", "Nov", "Dec"]
    private var pickerViewData: [String] = []
    
    // MARK: IB outlets
    @IBOutlet private weak var pickerView: UIPickerView!
    @IBOutlet private weak var tfDay: UITextField!
    @IBOutlet private weak var tfMonth: UITextField!
    
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
}

// MARK: Functions
extension VCPickerView {
    private func initialSetup() {
        pickerView.delegate = self
        pickerView.dataSource = self
        tfDay.delegate = self
        tfMonth.delegate = self
        pickerViewData = weekdays
        tfDay.addKeyboardBtnDone()
        tfMonth.addKeyboardBtnDone()
    }
}

// MARK: Pickerview data source
extension VCPickerView: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerViewData.count
    }
}

// MARK: Pickerview delegate methods
extension VCPickerView: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerViewData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if tfDay.isEditing {
            tfDay.text = pickerViewData[row]
        } else if tfMonth.isEditing {
            tfMonth.text = pickerViewData[row]
        }
    }
}

// MARK: Textfield delegate methods
extension VCPickerView: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        switch textField {
        case tfDay:
            pickerViewData = weekdays
        case tfMonth:
            pickerViewData = month
        default:
            pickerViewData = weekdays
        }
        pickerView.reloadAllComponents()
        return true
    }
}
