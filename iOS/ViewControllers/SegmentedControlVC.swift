//
//  VCSegmentedControl.swift
//  iOS
//
//  Created by Shubham Jitiya on 26/04/23.
//

import UIKit

class SegmentedControlVC: UIViewController {

    // MARK: IB outlets
    @IBOutlet private weak var segmentedControlTest: UISegmentedControl!
    
    // MARK: Lifecycle methods
    @IBOutlet weak var lblSelectedSegment: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        properties()
        styleSegmentedControl()
    }
}

// MARK: Extension functions
extension SegmentedControlVC {
    func properties() {
        segmentedControlTest.selectedSegmentIndex = 2
        segmentedControlTest.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
    }
    
    @objc private func segmentChanged(_ segment: UISegmentedControl) {
        lblSelectedSegment.text = segment.titleForSegment(at: segment.selectedSegmentIndex)
    }
    
    private func styleSegmentedControl() {
        segmentedControlTest.setImage(UIImage(systemName: "calendar"), forSegmentAt: 1)
    }
}
