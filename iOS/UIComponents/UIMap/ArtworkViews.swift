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
            // canShowCallout = true
            calloutOffset = CGPoint(x: -5, y: 5)
            let mapButton = UIButton(
                frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 48, height: 48))
            )
            let customCalloutView = Bundle.main.loadNibNamed("CustomCallout", owner: self, options: nil)?.first as? CustomCallout
            customCalloutView?.configure(title: artwork.title, subtitle: artwork.subtitle, image: artwork.image)
            image = artwork.image
            detailCalloutAccessoryView = customCalloutView
        }
    }
}
