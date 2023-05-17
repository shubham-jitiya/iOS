//
//  CustomCallout.swift
//  iOS
//
//  Created by Shubham Jitiya on 17/05/23.
//

import UIKit
import MapKit

class CustomCallout: UIView {
    // MARK: IB outlets
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubtitle: UILabel!
}

// MARK: Functions
extension CustomCallout {
    func configure(title: String?, subtitle: String?, image: UIImage){
        imgView.image = image
        lblTitle.text = title
        lblSubtitle.text = subtitle
    }
}
