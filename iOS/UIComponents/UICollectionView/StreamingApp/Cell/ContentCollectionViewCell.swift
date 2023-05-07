//
//  ContentCollectionViewCell.swift
//  iOS
//
//  Created by Shubham Jitiya on 05/05/23.
//

import UIKit

class ContentCollectionViewCell: UICollectionViewCell {
    // MARK: Variables
    static let identifier = "ContentCollectionViewCell"
    
    // MARK: IB outlets
    @IBOutlet weak var imgViewTvShows: UIImageView!
    
}

// MARK: Functions
extension ContentCollectionViewCell {
    static func getNib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    func config(data: Movie) {
        // set content poster images
        let imageUrl = data.poster ?? ""
        imgViewTvShows.kf.setImage(with: URL(string: imageUrl))
    }
}
