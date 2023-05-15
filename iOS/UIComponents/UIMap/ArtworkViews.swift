//
//  ArtworkMarkerView.swift
//  iOS
//
//  Created by Shubham Jitiya on 15/05/23.
//

import Foundation
import MapKit

class ArtworkMarkerView: MKAnnotationView {
    override var annotation: MKAnnotation? {
        willSet {
            guard let artwork = newValue as? Artwork else {
                return
            }
            canShowCallout = true
            calloutOffset = CGPoint(x: -5, y: 5)
            let mapButton = UIButton(
                frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 48, height: 48))
            )
            mapButton.setBackgroundImage(UIImage(named: "Map"), for: .normal)
            rightCalloutAccessoryView = mapButton
            let detailLabel = UILabel()
            detailLabel.numberOfLines = 0
            detailLabel.font = detailLabel.font.withSize(12)
            detailLabel.text = artwork.subtitle
            detailCalloutAccessoryView = detailLabel
            image =  artwork.image
        }
    }
}
