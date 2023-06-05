//
//  CustomSectionHeaderView.swift
//  iOS
//
//  Created by Shubham Jitiya on 01/05/23.
//

import UIKit

class CustomSectionHeaderView: UITableViewHeaderFooterView {
    // MARK: Variable
    static let identifier = "CustomSectionHeaderView"
    
    // MARK: IB outlets
    @IBOutlet weak var lblSectionHeader: UILabel!
}

// MARK: Functions
extension CustomSectionHeaderView {
    func config(_ section: String) {
        lblSectionHeader.text = section
        lblSectionHeader.textColor = .systemRed
        
    }
}
