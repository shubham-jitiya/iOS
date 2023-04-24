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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - IB Actions
    //when user tap & release
    @IBAction func btnTouchUpInside(_ sender: UIButton) {
        if !isTouchUpInside {
            btnTouchUpInside.tintColor = .red
            isTouchUpInside = true
        } else {
            btnTouchUpInside.tintColor = .systemBlue
            isTouchUpInside = false
        }
    }
    //when user click & move move finger outside
    @IBAction func btnTouchUpOutside(_ sender: UIButton) {
        if !isTouchOutside {
            btnTouchUpOutside.tintColor = .red
            isTouchOutside = true
        } else {
            btnTouchUpOutside.tintColor = .systemBlue
            isTouchOutside = false
        }
    }
    // This event will get called repeatedly while the user is dragging their finger outside of the button
    @IBAction func btnTouchDragOutside(_ sender: UIButton) {
        print("Btn touch drag outside")
        if !isDragTouchOutside {
            btnTouchDragOutside.tintColor = .red
            isDragTouchOutside = true
        } else {
            btnTouchDragOutside.tintColor = .systemBlue
            isDragTouchOutside = false
        }
    }
    // Similar to above but triggers while dragging finger inside btn
    @IBAction func btnTouchDragInside(_ sender: UIButton) {
        if !isDragTouchInside {
            btnTouchDragInside.tintColor = .red
            isDragTouchInside = true
        } else {
            btnTouchDragInside.tintColor = .systemBlue
            isDragTouchInside = false
        }
        //updateButton(&isTouchDownRepeat, &btnTouchDownRepeat)
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
    @IBAction func btnTouchDown(_ sender: Any) {
        print("Touch down")
    }
    @IBAction func btnTouchCancel(_ sender: Any) {
        print("Touch cancel")
    }
    @IBAction func btnPrimaryActionTriggered(_ sender: Any) {
        print("Primary action triggered")
    }
    @IBAction func btnEditingDidEnd(_ sender: Any) {
        print("btn Editing Did End")
    }
    @IBAction func btnEditingDidBegin(_ sender: Any) {
        print("btn Editing Did Begin")
    }
    @IBAction func btnEditingChanged(_ sender: Any) {
        print("btn Editing changed")
    }
    @IBAction func btnDidOnExit(_ sender: Any) {
        print("btn did on exit")
    }
    @IBAction func btnConfigurationSelected(_ sender: Any) {
        print("Btn configuration selected")
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
