//
//  HeaderSectionTitle.swift
//  iOS
//
//  Created by Shubham Jitiya on 04/05/23.
//

import UIKit

class HeaderSectionTitle: UICollectionReusableView {
    // MARK: Variables
    static let identifier = "HeaderSectionTitle"
    
    // MARK: IB outlets
    @IBOutlet weak var lblSectionTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

// MARK: Functions
extension HeaderSectionTitle {
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
