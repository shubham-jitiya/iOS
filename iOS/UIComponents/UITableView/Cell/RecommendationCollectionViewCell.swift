//
//  CVRecommendationCell.swift
//  iOS
//
//  Created by Shubham Jitiya on 04/05/23.
//

import UIKit

class RecommendationCollectionViewCell: UICollectionViewCell {
    // MARK: IB outlets
    @IBOutlet weak var imgView: UIImageView!
    
    // MARK: Lifecycle methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

// MARK: Functions
extension RecommendationCollectionViewCell {
    func config(data: Movie) {
         let imageUrl = data.poster ?? ""
         imgView.kf.setImage(with: URL(string: imageUrl))
    }
}
