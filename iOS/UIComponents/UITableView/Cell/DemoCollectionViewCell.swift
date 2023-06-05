//
//  DemoCollectionViewCell.swift
//  iOS
//
//  Created by Shubham Jitiya on 03/05/23.
//

import UIKit

class DemoCollectionViewCell: UICollectionViewCell {
    // MARK: IB outlets
    @IBOutlet weak var lblName: UILabel!
}

// MARK: Extension
extension DemoCollectionViewCell {
    func configure(data: String) {
        lblName.text = data
    }
}
