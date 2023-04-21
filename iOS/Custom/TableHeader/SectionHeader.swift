//
//  SectionHeader.swift
//  iOS
//
//  Created by Shubham Jitiya on 02/05/23.
//

import UIKit

class SectionHeader: UITableViewHeaderFooterView {
    // MARK: IB outlets
    @IBOutlet weak var lblSectionHeader: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
}

// MARK: Functions
extension SectionHeader {
    func configure() {
        lblSectionHeader.textColor = .white
    }
}
