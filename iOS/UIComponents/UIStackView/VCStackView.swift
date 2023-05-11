//
//  VCStackView.swift
//  iOS
//
//  Created by Shubham Jitiya on 11/05/23.
//

import UIKit

class VCStackView: UIViewController {
    // MARK: Variables
    let dataArray = ["Item 1", "Item 2", "Item 3"]

    // MARK: IB outlets
    @IBOutlet weak var stackViewItems: UIStackView!
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
}

// MARK: Functions
extension VCStackView {
    private func initialSetup() {
        for data in dataArray {
            if let view = Bundle.main.loadNibNamed("StackItems", owner: nil)?.first as? StackItems {
                view.lblTitle.text = data
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
                view.addGestureRecognizer(tapGesture)
                stackViewItems.addArrangedSubview(view)
            }
        }
        
    }
    
    @objc private func handleTapGesture(_ gestureRecognizer: UITapGestureRecognizer) {
          // Handle the tap gesture
          print("Custom view tapped")
      }
}
