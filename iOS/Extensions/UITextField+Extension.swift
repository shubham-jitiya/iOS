//
//  UITextField+Extension.swift
//  iOS
//
//  Created by Shubham Jitiya on 25/04/23.
//

import UIKit

extension UITextField {
    // Padding
    func addLeftPadding(_ padding: Double) {
        let leftView = UIView()
        leftView.frame = CGRectMake(0.0, 0.0, padding, self.frame.size.height)
        self.leftView = leftView
        self.leftViewMode = .always
    }
    
    func addRightPadding(_ padding: Double){
        let rightView = UIView()
        rightView.frame = CGRect(x: 0, y: 0, width: padding, height: self.frame.size.height)
        self.rightView = rightView
        self.rightViewMode = .always
    }
    
    func addPadding(left: Double, right: Double){
        let leftView = UIView(), rightView = UIView()
        rightView.frame = CGRect(x: 0, y: 0, width: right, height: self.frame.size.height)
        leftView.frame = CGRect(x: 0, y: 0, width: left, height: self.frame.size.height)
        self.rightView = rightView
        self.leftView = leftView
        rightViewMode = .always
        leftViewMode = .always
    }
    
    func addPaddingToImageLeft(_ padding: Double, src: String){
        let leftView = UIView(), imgView = UIImageView.init(image: UIImage.init(systemName: src))
        leftView.frame = CGRect(x: 0, y: 0, width: 28.0 + 10, height: frame.size.height)
        imgView.frame = CGRect(x: 5.0, y: 5.0, width: 28.0, height: frame.size.height - 10.0)
        imgView.tintColor = UIColor.gray
        leftView.addSubview(imgView)
        self.leftView = leftView
        leftViewMode = .always
    }
    
    // Dismiss keyboard
    func addKeyboardBtnDone() {
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let itemDoneButton = UIBarButtonItem(
            title: "Done",
            style: .done,
            target: self,
            action: #selector(doneButtonTapped))
        itemDoneButton.tintColor = UIColor(named: Constants.Colors.primaryColor.rawValue)
        let itemFlexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.items = [itemFlexSpace, itemDoneButton]
        toolbar.sizeToFit()
        self.inputAccessoryView = toolbar
    }

    @objc func doneButtonTapped() {
        resignFirstResponder()
    }
    
    func setImageRight(image: UIImage) {
        let newView = UIView(frame: CGRect(x: 0, y: 0.0, width: frame.size.height, height: frame.size.height))
        let image = UIImageView(image: image)
        image.contentMode = .center
        image.tintColor = .systemGray2
        image.frame = CGRect(x: 0, y: 0, width: newView.frame.width, height: newView.frame.height)
        newView.addSubview(image)
        rightView = newView
        rightViewMode = .always
    }
}

// MARK: Validation
extension UITextField {
    func toggleAlertState(_ alert: Bool) {
        if alert {
            self.layer.borderColor = UIColor.systemRed.cgColor
            self.layer.borderWidth = 1
            self.layer.cornerRadius = 4
        } else {
            self.layer.borderColor = UIColor.systemGray5.cgColor
        }
    }
    
    func validateUppercaseLowercaseWhiteSpaces(userInput: String) -> Bool {
        let validString = CharacterSet.uppercaseLetters.union(.lowercaseLetters).union(.whitespaces)
        let trimmedString = userInput.trimmingCharacters(in: .whitespaces)
        if trimmedString.isEmpty { return false }
        if trimmedString.rangeOfCharacter(from: validString.inverted) == nil {
            return true
        } else {
            return false
        }
    }
    
    func validateEmail(userInput: String) -> Bool {
        let validEmail = CharacterSet(
            charactersIn:  Constants.StringConstants.validationAlphabets.rawValue + Constants.StringConstants.validationNumbers.rawValue + "@._-")
        let trimmedString = userInput.trimmingCharacters(in: .whitespaces)
        if trimmedString.isEmpty { return false }
        if trimmedString.rangeOfCharacter(from: validEmail.inverted) == nil && trimmedString.contains("@") && (trimmedString.hasSuffix(".com") || trimmedString.hasSuffix(".in")) {
            return true
        } else {
            return false
        }
    }
    
    func validatePassword(userInput: String) -> Bool {
        let validNumbers = CharacterSet(charactersIn: Constants.StringConstants.validationNumbers.rawValue)
        let trimmedPassword = userInput.trimmingCharacters(in: .whitespaces)
        if trimmedPassword.isEmpty { return false }
        if trimmedPassword.count >= 6 && trimmedPassword.count <= 12 {
            return trimmedPassword.rangeOfCharacter(from: validNumbers.inverted) == nil
        } else {
            return false
        }
    }
}

// MARK: Picker
extension UITextField {
    func addDatePicker() {
        let datePicker = UIDatePicker()
        datePicker.tintColor = UIColor(named: Constants.Colors.primaryColor.rawValue)
        datePicker.datePickerMode = .date
        datePicker.minimumDate = Date()
        datePicker.preferredDatePickerStyle = .inline
        datePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
        self.inputView = datePicker
    }
    
    @objc func dateChanged(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = Constants.StringConstants.dateFormat.rawValue
        self.text = formatter.string(from: sender.date)
    }
    
    // MARK: Time picker
    func addTimePicker() {
        let timePicker = UIDatePicker()
        timePicker.tintColor = UIColor(named: Constants.Colors.primaryColor.rawValue)
        timePicker.datePickerMode = .time
        timePicker.preferredDatePickerStyle = .wheels
        timePicker.addTarget(self, action: #selector(timeChanged), for: .valueChanged)
        self.inputView = timePicker
    }
    
    @objc func timeChanged(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        self.text = formatter.string(from: sender.date)
    }
    
    // MARK: Timezone picker
    func addTimeZonePicker() {
        let timeZonePicker = UIPickerView()
        timeZonePicker.tintColor = UIColor(named: Constants.Colors.primaryColor.rawValue)
        timeZonePicker.delegate = self
        timeZonePicker.dataSource = self
        timeZonePicker.tag = 0
        inputView = timeZonePicker
    }
    
    // MARK: Frequency picker
    func addFrequencyPicker() {
        let frequencyPicker = UIPickerView()
        frequencyPicker.tintColor = UIColor(named: Constants.Colors.primaryColor.rawValue)
        frequencyPicker.delegate = self
        frequencyPicker.dataSource = self
        frequencyPicker.tag = Constants.Tags.frequency.rawValue
        inputView = frequencyPicker
    }
    
    // MARK: Remainder picker
    func addRemainderPicker() {
        let remainderPicker = UIPickerView()
        remainderPicker.delegate = self
        remainderPicker.dataSource = self
        remainderPicker.tag = Constants.Tags.remainder.rawValue
        inputView = remainderPicker
    }
    
    // MARK: Duration picker
    func addDurationPicker(interval: Int) {
        let durationPicker = UIPickerView()
        durationPicker.delegate = self
        durationPicker.dataSource = self
        durationPicker.tag = Constants.Tags.duration.rawValue
        inputView = durationPicker
    }
}

// MARK: Delegate - Datasource view
extension UITextField: UIPickerViewDataSource {
    var timeZones: [String] {
        return Helper.getTimeZones()
    }
    
    var frequency: [String] {
        return Helper.getFrequencyOfMeeting()
    }
    
    var remainder: [String] {
        return Helper.getRemainders()
    }
    
    var duration: [String] {
        return Helper.getDuration(minutes: 45, hour: 8, interval: 15)
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        switch pickerView.tag {
        case Constants.Tags.duration.rawValue:
            return 2
        default:
            return 1
        }
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 0:
            return timeZones.count
        case Constants.Tags.frequency.rawValue:
            return frequency.count
        case Constants.Tags.remainder.rawValue:
            return remainder.count
        case Constants.Tags.duration.rawValue:
            return duration.count
        default:
            return 0
        }
    }
}

// MARK: Delegate - Picker view
extension UITextField: UIPickerViewDelegate {
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 0:
            return timeZones[row]
        case Constants.Tags.frequency.rawValue:
            return frequency[row]
        case Constants.Tags.remainder.rawValue:
            return remainder[row]
        case Constants.Tags.duration.rawValue:
            return duration[row]
        default:
            return nil
        }
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        switch pickerView.tag {
        case 0:
            self.text = timeZones[row]
        case Constants.Tags.frequency.rawValue:
            self.text = frequency[row]
        case Constants.Tags.remainder.rawValue:
            self.text = remainder[row]
        case Constants.Tags.duration.rawValue:
            self.text = duration[row]
        default:
            break
        }
    }
    
    public func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        let totalWidth = pickerView.bounds.width
        return totalWidth
    }
}
