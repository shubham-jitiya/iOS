//
//  ViewController.swift
//  iOS
//
//  Created by Shubham Jitiya on 12/04/23.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var btnOne: UIButton!
    @IBOutlet weak var lblWelcome: UILabel!
    @IBOutlet weak var lblName: CustomTextField!
    
    //MARK: - View life cycles
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblWelcome.text = "View did load"
        btnOne.layer.cornerRadius = 16
        btnOne.clipsToBounds = true
        btnOne.setTitle("BtnOne", for: .normal)
        lblName.layer.borderColor = UIColor.blue.cgColor
        lblName.layer.borderWidth = 1
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
    
    //MARK: - IB Action
    @IBAction func btnOne(_ sender: UIButton) {
        print("Button one pressed")
    }
}

