//
//  HeaderCollectionViewCell.swift
//  iOS
//
//  Created by Shubham Jitiya on 04/05/23.
//

import UIKit

class HeaderCollectionViewCell: UICollectionViewCell {
    
    // MARK: IB outlets
    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

// MARK: Functions
extension HeaderCollectionViewCell {
    func configure(with image: UIImage) {
        imgView.image = image
    }
}
