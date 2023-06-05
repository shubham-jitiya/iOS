//
//  VCDatePicker.swift
//  iOS
//
//  Created by Shubham Jitiya on 11/05/23.
//

import UIKit

class DatePickerVC: UIViewController {
    // MARK: Variables
    private let dateOfBirth = DateFormatter()
    private var datePicker: UIDatePicker!
    
    // MARK: IB outlets
    @IBOutlet private weak var lblDOB: UITextField!
    @IBOutlet private weak var tfDateOfBirth: UITextField!
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
}

// MARK: Functions
extension DatePickerVC {
    private func initialSetup() {
        dateOfBirth.dateFormat = Constants.StringConstants.dateFormat.rawValue
        updateInputView()
        tfDateOfBirth.text = dateOfBirth.string(from: datePicker.date)
        tfDateOfBirth.addKeyboardBtnDone()
    }
    
    private func updateInputView() {
        datePicker = UIDatePicker()
        datePicker.preferredDatePickerStyle = .inline
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
        lblDOB.inputView = datePicker
    }
    
    @objc private func datePickerValueChanged() {
        tfDateOfBirth.text = dateOfBirth.string(from: datePicker.date)
        print("value changed")
    }
}
