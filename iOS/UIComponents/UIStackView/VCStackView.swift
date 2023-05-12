//
//  VCStackView.swift
//  iOS
//
//  Created by Shubham Jitiya on 11/05/23.
//

import UIKit

class VCStackView: UIViewController {
    // MARK: Variables
    private let dataArray: [String] = ["Item 1", "Item 2", "Item 3",  "Item 4"]
    private let newData = "New data added"

    // MARK: IB outlets
    @IBOutlet weak var stackViewItems: UIStackView!
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
}

// MARK: IB actions
extension VCStackView {
    @IBAction private func btnSubmit(_ sender: UIButton) {
        if let itemView = Bundle.main.loadNibNamed("StackItems", owner: nil)?.first as? StackItems {
            itemView.layer.cornerRadius = 16
            itemView.config(newData)
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
            itemView.addGestureRecognizer(tapGesture)
            stackViewItems.addArrangedSubview(itemView)
        }
    }
}

// MARK: Functions
extension VCStackView {
    private func initialSetup() {
        for data in dataArray {
            if let itemView = Bundle.main.loadNibNamed("StackItems", owner: nil)?.first as? StackItems {
                itemView.layer.cornerRadius = 16
                itemView.config(data)
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
                itemView.addGestureRecognizer(tapGesture)
                stackViewItems.addArrangedSubview(itemView)
            }
        }
        
    }
    
    @objc private func handleTapGesture(_ gestureRecognizer: UITapGestureRecognizer) {
          // Handle the tap gesture
          print("Custom view tapped")
      }
}
