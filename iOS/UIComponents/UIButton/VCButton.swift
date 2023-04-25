//
//  VCButton.swift
//  iOS
//
//  Created by Shubham Jitiya on 24/04/23.
//

import UIKit

class VCButton: UIViewController {
    //MARK: - Variables
    private var isTouchUpInside = false
    private var isTouchOutside = false
    private var isDragTouchOutside = false
    private var isDragTouchInside = false
    private var isDragTouchExit = false
    private var isDragTouchEnter = false
    private var isTouchDownRepeat = false
    
    //MARK: - IB Outlets
    @IBOutlet weak var btnTouchUpInside: UIButton!
    @IBOutlet weak var btnTouchUpOutside: UIButton!
    @IBOutlet weak var btnTouchDragOutside: UIButton!
    @IBOutlet weak var btnTouchDragInside: UIButton!
    @IBOutlet weak var btnTouchDragExit: UIButton!
    @IBOutlet weak var btnTouchDragEnter: UIButton!
    @IBOutlet weak var btnTouchDownRepeat: UIButton!
    @IBOutlet weak var btnBgImage: UIButton!
    @IBOutlet weak var btnStates: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnTouchUpInside.layer.shadowColor = UIColor.blue.cgColor
        btnTouchUpInside.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        btnTouchUpInside.layer.shadowOpacity = 0.8
    }
    
    //MARK: - IB Actions
    //when user tap & release
    @IBAction func btnTouchUpInside(_ sender: UIButton) {
        updateButton(&isTouchUpInside, &btnTouchUpInside)
    }
    //when user click & move move finger outside
    @IBAction func btnTouchUpOutside(_ sender: UIButton) {
        updateButton(&isTouchOutside, &btnTouchUpOutside)
    }
    // This event will get called repeatedly while the user is dragging their finger outside of the button
    @IBAction func btnTouchDragOutside(_ sender: UIButton) {
        print("Btn touch drag outside")
        updateButton(&isDragTouchOutside, &btnTouchDragOutside)
    }
    // Similar to above but triggers while dragging finger inside btn
    @IBAction func btnTouchDragInside(_ sender: UIButton) {
        updateButton(&isDragTouchInside, &btnTouchDragInside)
    }
    //Drag & release outside
    @IBAction func btnTouchDragExit(_ sender: UIButton) {
        print("Exit")
        updateButton(&isDragTouchExit, &btnTouchDragExit)
    }
    //Drag & release inside?
    @IBAction func btnTouchDragEnter(_ sender: UIButton) {
        print("Enter")
        //updateButton(isTouched: &isDragTouchEnter, btnType: &btnTouchDragEnter)
    }
    //Double tap
    @IBAction func btnTouchDownRepeat(_ sender: UIButton) {
        print("Touch down repeat")
        updateButton(&isTouchDownRepeat, &btnTouchDownRepeat)
    }
    @IBAction func btnTouchDown(_ sender: UIButton) {
        print("Touch down")
    }
    @IBAction func btnTouchCancel(_ sender: UIButton) {
        print("Touch cancel")
    }
    @IBAction func btnPrimaryActionTriggered(_ sender: UIButton) {
        print("Primary action triggered")
    }
    @IBAction func btnEditingDidEnd(_ sender: UIButton) {
        print("btn Editing Did End")
    }
    @IBAction func btnEditingDidBegin(_ sender: UIButton) {
        print("btn Editing Did Begin")
    }
    @IBAction func btnEditingChanged(_ sender: UIButton) {
        print("btn Editing changed")
    }
    @IBAction func btnDidOnExit(_ sender: UIButton) {
        print("btn did on exit")
    }
    @IBAction func btnConfigurationSelected(_ sender: UIButton) {
        print("Btn configuration selected")
    }
    
    @IBAction func btnBgImage(_ sender: UIButton) {
        
    }
    @IBAction func btnStates(_ sender: UIButton) {
        print("selected: ", btnStates.isSelected)
        print("highlighted: ", btnStates.isHighlighted)
        print("enabled: ", btnStates.isEnabled)
        
        if !btnStates.isSelected {
            btnStates.isSelected = true
            btnStates.backgroundColor = .orange
        } else {
            btnStates.isSelected = false
            btnStates.backgroundColor = .gray
            
        }
        btnStates.setTitleColor(.black, for: .selected)
        btnStates.setTitleColor(.yellow, for: .highlighted)
        btnStates.setTitleColor(.white, for: .normal)
    }
}

func updateButton(_ isTouched: inout Bool, _ btnType: inout UIButton) {
    if !isTouched {
        btnType.tintColor = .red
        isTouched = true
    } else {
        btnType.tintColor = .systemBlue
        isTouched = false
    }
}
