//
//  HeaderCollectionViewCell.swift
//  iOS
//
//  Created by Shubham Jitiya on 04/05/23.
//

import UIKit

class HeaderCollectionViewCell: UICollectionViewCell {
    // MARK: Variables
    static let identifier = "HeaderCollectionViewCell"
    
    // MARK: IB outlets
    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

// MARK: Functions
extension HeaderCollectionViewCell {
    func cofigure(with image: UIImage) {
        imgView.image = image
    }
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
