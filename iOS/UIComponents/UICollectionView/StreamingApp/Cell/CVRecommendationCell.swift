//
//  CVRecommendationCell.swift
//  iOS
//
//  Created by Shubham Jitiya on 04/05/23.
//

import UIKit

class CVRecommendationCell: UICollectionViewCell {
    // MARK: Variables
    static let identifier = "CVRecommendationCell"
    
    // MARK: IB outlets
    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

// MARK: Functions
extension CVRecommendationCell {
    func setImage(with image: UIImage) {
        imgView.image = image
    }
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
