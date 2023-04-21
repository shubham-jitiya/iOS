//
//  ScheduleMeetingVC.swift
//  iOS
//
//  Created by Shubham Jitiya on 24/05/23.
//

import UIKit

class ScheduleMeetingVC: UIViewController {
    // MARK: Variables
    private var moderatorsList = [String]()
    private var attendeesList = [String]()
    private let maxModeratorImages = 3, maxAttendeesImages = 2
    private var currentAttendeesCount = 1, currentModeratorsCount = 1
    
    // MARK: IB outlets
    @IBOutlet private weak var customNavbar: UIView!
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var txtMeetingTitle: UITextField!
    @IBOutlet private weak var lblInvalidMeetingTitle: UILabel!
    @IBOutlet private weak var txtDescription: UITextView!
    @IBOutlet private weak var txtStartDate: UITextField!
    @IBOutlet private weak var lblInvalidStartDate: UILabel!
    @IBOutlet private weak var txtStartTime: UITextField!
    @IBOutlet private weak var txtTimeZone: UITextField!
    @IBOutlet private weak var txtDuration: UITextField!
    @IBOutlet private weak var lblInvalidDuration: UILabel!
    @IBOutlet private weak var txtMeetingFrequency: UITextField!
    @IBOutlet private weak var txtRemainder: UITextField!
    @IBOutlet private weak var stackContainerModerator: UIStackView!
    @IBOutlet private weak var txtEmailModerator: UITextField!
    @IBOutlet private weak var lblInvalidModeratorEmail: UILabel!
    @IBOutlet private weak var stackContainerAttendees: UIStackView!
    @IBOutlet private weak var txtEmailAttendee: UITextField!
    @IBOutlet private weak var lblInvalidEmailAttendees: UILabel!
    @IBOutlet private weak var stackContainerMeetingPassword: UIStackView!
    @IBOutlet private weak var txtMeetingPassword: UITextField!
    @IBOutlet private weak var lblInvalidMeetingPassword: UILabel!
    @IBOutlet private weak var stackCollapsable: UIStackView!
    @IBOutlet private weak var btnCollapse: UIButton!
    @IBOutlet private weak var switchRequirePassword: UISwitch!
    @IBOutlet private weak var switchEnableChat: UISwitch!
    @IBOutlet private weak var switchFacialExpression: UISwitch!
    @IBOutlet private weak var switchRecordMeeting: UISwitch!
    @IBOutlet private weak var switchEnterLobby: UISwitch!
    @IBOutlet private weak var switchStartMuted: UISwitch!
    @IBOutlet private weak var switchStartsHidden: UISwitch!
    @IBOutlet private weak var stackModeratorContainer: UIStackView!
    @IBOutlet private weak var stackAttendeesContainer: UIStackView!
    @IBOutlet private weak var stackAttendees: UIStackView!
    @IBOutlet private weak var stackModerators: UIStackView!
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
}

// MARK: IB actions
extension ScheduleMeetingVC {
    
    @IBAction private func btnBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func btnShowModeratorEmailTapped(_ sender: UIButton) {
        stackContainerModerator.showStack(stackContainerModerator.isHidden)
    }
    
    @IBAction private func btnShowAttendeesEmailTapped(_ sender: UIButton) {
        stackContainerAttendees.showStack(stackContainerAttendees.isHidden)
    }
    
    @IBAction private func switchRequirePassword(_ sender: UISwitch) {
        stackContainerMeetingPassword.showStack(sender.isOn)
    }
    
    @IBAction private func btnToggleOthersOptionTapped(_ sender: UIButton) {
        guard let btnText = btnCollapse.titleLabel?.text else {
            return
        }
        let isExpanded = (btnText == Constants.StringConstants.less.rawValue)
        btnCollapse.setTitle(isExpanded ? Constants.StringConstants.more.rawValue : Constants.StringConstants.less.rawValue, for: .normal)
        btnCollapse.setImage(UIImage(systemName: isExpanded ? Constants.Images.chevronDown.rawValue : Constants.Images.chevronUp.rawValue),
                             for: .normal)
        stackCollapsable.isHidden = isExpanded
        if isExpanded {
            scrollView.setContentOffset(CGPoint.zero, animated: true)
        }
    }
    
    @IBAction private func btnSaveInfoTapped() {
        var newMeeting = ScheduleMeeting()
        guard let meetingTitle = txtMeetingTitle.text?.trimmingCharacters(in: .whitespaces), !meetingTitle.isEmpty else {
            updateTxtMeetingTitle()
            txtMeetingTitle.becomeFirstResponder()
            return
        }
        
        if switchRequirePassword.isOn {
            guard let password = txtMeetingPassword.text,
                  txtMeetingPassword.validatePassword(userInput: password) else {
                updateTxtMeetingTitle()
                txtMeetingPassword.becomeFirstResponder()
                return
            }
            newMeeting.meetingPassword = password
        }
        newMeeting.title = meetingTitle
        newMeeting.isRequirePassword = switchRequirePassword.isOn
        newMeeting.description = txtDescription.text
        newMeeting.startDate = txtStartDate.text
        newMeeting.startTime = txtStartTime.text
        newMeeting.timeZone = txtTimeZone.text
        newMeeting.duration = txtDuration.text
        newMeeting.frequency = txtMeetingFrequency.text
        newMeeting.remainder = txtRemainder.text
        newMeeting.isEnabledChat = switchEnableChat.isOn
        newMeeting.isFacialExpression = switchFacialExpression.isOn
        newMeeting.isRecordMeeting = switchRecordMeeting.isOn
        newMeeting.isEnabledLobby = switchEnterLobby.isOn
        newMeeting.isEveryoneMuted = switchStartMuted.isOn
        newMeeting.isStartsHidden = switchStartsHidden.isOn
        newMeeting.emailModerator = moderatorsList
        newMeeting.emailAttendees = attendeesList
        print(newMeeting)
    }
}

// MARK: Functions
extension ScheduleMeetingVC {
    private func initialSetup() {
        navigationController?.setNavigationBarHidden(true, animated: true)
        setupAutoScroll()
        setupTextViews()
    }
    
    private func setupTextViews() {
        customNavbar.addBottomBorder(color: UIColor.systemGray4, width: 1)
        txtStartDate.text = Helper.getCurrentDate()
        txtStartDate.addDatePicker()
        txtStartTime.text = Helper.getCurrentTime()
        txtStartTime.addTimePicker()
        txtTimeZone.addTimeZonePicker()
        txtMeetingFrequency.addFrequencyPicker()
        txtRemainder.addRemainderPicker()
        txtDuration.addDurationPicker(interval: 15)
    }
    
    private func updateTxtMeetingTitle() {
        guard let meetingTitle = txtMeetingTitle.text else {
            return
        }
        let isValid = txtMeetingTitle.validateUppercaseLowercaseWhiteSpaces(userInput: meetingTitle)
        txtMeetingTitle.toggleAlertState(!isValid)
        lblInvalidMeetingTitle.showInvalidLabel(!isValid)
    }
    
    private func updateTxtStartDate() {
        guard let startDate = txtStartDate.text else {
            return
        }
        let isValid = Helper.isDateLessThanYear(startDate)
        txtStartDate.toggleAlertState(!isValid)
        lblInvalidStartDate.showInvalidLabel(!isValid)
    }
    
    private func updateTxtMeetingPassword() {
        guard let meetingPassword = txtMeetingPassword.text else {
            return
        }
        let isValidPassword = txtMeetingPassword.validatePassword(userInput: meetingPassword)
        txtMeetingPassword.toggleAlertState(!isValidPassword)
        lblInvalidMeetingPassword.showInvalidLabel(!isValidPassword)
    }
    
    private func updateTxtModeratorEmail() {
        guard let email = txtEmailModerator.text, !email.isEmpty else {
            return
        }
        let isValidEmail = email.validateEmail()
        txtEmailModerator.toggleAlertState(!isValidEmail)
        lblInvalidModeratorEmail.showInvalidLabel(!isValidEmail)
    }
    
    private func addModerator() {
        if let email = txtEmailModerator.text, email.validateEmail() {
            moderatorsList.append(email)
            handleModeratorsStackImage()
            txtEmailModerator.text?.removeAll()
        }
    }
    
    private func updateTxtAttendeesEmail() {
        guard let email = txtEmailAttendee.text, !email.isEmpty else {
            return
        }
        let isValidEmail = email.validateEmail()
        txtEmailAttendee.toggleAlertState(!isValidEmail)
        lblInvalidEmailAttendees.showInvalidLabel(!isValidEmail)
    }
    
    private func addAttendee() {
        if let email = txtEmailAttendee.text, email.validateEmail() {
            attendeesList.append(email)
            handleAttendeesStackImage()
            txtEmailAttendee.text?.removeAll()
        }
    }
    
    private func getStackImageCount() -> UILabel {
        let lblCounter = UILabel()
        lblCounter.text = "+\(1)"
        lblCounter.font = UIFont.systemFont(ofSize: 12)
        lblCounter.textColor = .white
        lblCounter.textAlignment = .center
        lblCounter.layer.cornerRadius = 15
        lblCounter.layer.borderColor = UIColor.white.cgColor
        lblCounter.layer.borderWidth = 1
        lblCounter.layer.backgroundColor = UIColor(named: Constants.Colors.primaryColor.rawValue)?.cgColor
        lblCounter.widthAnchor.constraint(equalToConstant: 30).isActive = true
        return lblCounter
    }
    
    private func updateAttendeesCount() {
        if let label = stackAttendees.arrangedSubviews.last as? UILabel {
            currentAttendeesCount += 1
            label.text = "+\(currentAttendeesCount)"
        }
    }
    
    private func updateModeratorsCount() {
        if let label = stackModerators.arrangedSubviews.last as? UILabel {
            currentModeratorsCount += 1
            label.text = "+\(currentModeratorsCount)"
        }
    }
    
    private func handleModeratorsStackImage() {
        if stackModerators.arrangedSubviews.count < maxModeratorImages {
            stackModerators.addArrangedSubview(Helper.getRandomPeopleImage())
        } else if stackModerators.arrangedSubviews.count == maxModeratorImages {
            stackModerators.addArrangedSubview(getStackImageCount())
        } else {
            updateModeratorsCount()
        }
    }
    
    private func handleAttendeesStackImage() {
        if stackAttendees.arrangedSubviews.count < maxAttendeesImages {
            stackAttendees.addArrangedSubview(Helper.getRandomPeopleImage())
        } else if stackAttendees.arrangedSubviews.count == maxAttendeesImages {
            stackAttendees.addArrangedSubview(getStackImageCount())
        } else {
            updateAttendeesCount()
        }
    }
}

// MARK: Extension - Helper functions
extension ScheduleMeetingVC {
    private func setupAutoScroll() {
        NotificationCenter.default.addObserver(
            self, selector: #selector(keyboardWillShow(_:)),
            name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(
            self, selector: #selector(keyboardWillHide(_:)),
            name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if let userInfo = notification.userInfo,
           let keyboardSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.size {
            let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
            scrollView.contentInset = contentInsets
            scrollView.scrollIndicatorInsets = contentInsets
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
}

// MARK: Delegate - Textfield
extension ScheduleMeetingVC: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case txtMeetingTitle:
            updateTxtMeetingTitle()
        case txtStartDate:
            updateTxtStartDate()
        case txtEmailModerator:
            updateTxtModeratorEmail()
            addModerator()
        case txtEmailAttendee:
            updateTxtAttendeesEmail()
            addAttendee()
        case txtMeetingPassword:
            updateTxtMeetingPassword()
        default:
            break
        }
    }
    
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String) -> Bool {
            if (string == ","  || string == " ") && range.location == textField.text?.count {
                switch textField {
                case txtEmailModerator:
                    updateTxtModeratorEmail()
                    addModerator()
                    return false
                case txtEmailAttendee:
                    updateTxtAttendeesEmail()
                    addAttendee()
                    return false
                default:
                    return true
                }
            }
            return true
        }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case txtMeetingTitle:
            txtDescription.becomeFirstResponder()
        case txtRemainder:
            txtEmailModerator.becomeFirstResponder()
        case txtEmailModerator:
            txtEmailAttendee.becomeFirstResponder()
        case txtEmailAttendee:
            txtEmailAttendee.resignFirstResponder()
        default:
            return true
        }
        return false
    }
}
