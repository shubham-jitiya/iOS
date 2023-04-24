//
//  VCLabels.swift
//  iOS
//
//  Created by Shubham Jitiya on 24/04/23.
//

import UIKit

class VCLabels: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var lblWelcome: UILabel!
    @IBOutlet weak var txtField: CustomTextField!
    @IBOutlet weak var btnOne: UIButton!
    @IBOutlet weak var lblCustomAttributedText: UILabel!
    @IBOutlet weak var lblAttributedExtension: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblWelcome.text = "View did load"
        btnOne.layer.cornerRadius = 16
        btnOne.clipsToBounds = true
        btnOne.setTitle("BtnOne", for: .normal)
        txtField.layer.borderColor = UIColor.blue.cgColor
        txtField.layer.borderWidth = 1
        attributedText()
                        
    }
    
    // MARK: - IB Actions
    @IBAction func btnOne(_ sender: UIButton) {
        print("Button one pressed")
    }
    
    //MARK: - Functions
    private func attributedText() {
        let sampleText = "Hello, world"
        let attrs = [NSAttributedString.Key.foregroundColor : UIColor.white]
        let attributedString = NSMutableAttributedString(string: sampleText, attributes: attrs)
            
        attributedString.append(
            NSAttributedString(string: "\nThis is new line"))
        attributedString.append(
            NSAttributedString(
                string: "\nMake this bold",
                attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)]))
        attributedString.append(
            NSAttributedString(
                string: "\nChange Font",
                attributes: [NSAttributedString.Key.font:  UIFont(
                    name: "Noteworthy",
                    size: 24.0) as Any]))
        let rangeToUnderline = NSRange(location: 13, length: 4)
        attributedString.addAttributes(
            [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.double.rawValue,
             NSAttributedString.Key.underlineColor: UIColor.systemRed
            ], range: rangeToUnderline)
        
        lblCustomAttributedText.attributedText = attributedString
        lblCustomAttributedText.numberOfLines = 0
        lblAttributedExtension.attributedText = NSMutableAttributedString()
            .bold("Address: ", UIColor.white)
            .normal("Kathmandu, Nepal", UIColor.white)
            .blackHighlight("\n Email: ", UIColor.white)
            .orangeHighlight(" shubhamj@simformsolutions.com ")
            .bold("\nCopyright: ", UIColor.white)
            .underlined("All rights reserved 2023", UIColor.white)
        lblAttributedExtension.numberOfLines = 0
    }
}
