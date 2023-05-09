//
//  ContentCollectionViewCell.swift
//  iOS
//
//  Created by Shubham Jitiya on 05/05/23.
//

import UIKit

class ContentCollectionViewCell: UICollectionViewCell {
    // MARK: IB outlets
    @IBOutlet weak var imgViewContent: UIImageView!
}

// MARK: Functions
extension ContentCollectionViewCell {
    static func getNib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    func config(data: Movie) {
        // set content poster images
        let imageUrl = data.poster ?? ""
        imgViewContent.kf.setImage(with: URL(string: imageUrl))
    }
}
