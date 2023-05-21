//
//  VCStepper.swift
//  iOS
//
//  Created by Shubham Jitiya on 26/04/23.
//

import UIKit

class StepperVC: UIViewController {
    // MARK: IB Outlets
    @IBOutlet weak var lblCounter: UILabel!
    @IBOutlet weak var stepperIncrementCounter: UIStepper!
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialise()
        styleStepper()
    }
    
    // MARK: IB actions
    @IBAction func updateCounter(_ sender: UIStepper) {
        lblCounter.text = String(sender.value)
    }
}

// MARK: Extension functions
extension StepperVC {
    private func initialise() {
        stepperIncrementCounter.value = 0
        lblCounter.text = String(stepperIncrementCounter.value)
        stepperIncrementCounter.minimumValue = -10
        stepperIncrementCounter.maximumValue = 10
        stepperIncrementCounter.stepValue = 0.5
        stepperIncrementCounter.autorepeat = false
        stepperIncrementCounter.wraps = true
    }
    
    private func styleStepper() {
        stepperIncrementCounter.setIncrementImage(UIImage(systemName: Constants.Images.plusCircleFill.rawValue), for: .highlighted)
        stepperIncrementCounter.setDecrementImage(UIImage(systemName: Constants.Images.minusCircleFill.rawValue), for: .highlighted)
    }
}
