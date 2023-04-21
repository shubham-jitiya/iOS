//
//  Artwork.swift
//  iOS
//
//  Created by Shubham Jitiya on 15/05/23.
//

import Foundation
import MapKit
import Contacts

class Artwork: NSObject, MKAnnotation {
    let title: String?
    let locationName: String?
    let discipline: String?
    let coordinate: CLLocationCoordinate2D
    var subtitle: String? {
        return locationName
    }
    var mapItem: MKMapItem? {
        guard let location = locationName else {
            return nil
        }
        let addressDict = [CNPostalAddressStreetKey:location]
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDict)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = title
        return mapItem
    }
    var tintColor: UIColor {
        switch discipline {
        case "Monument":
            return .red
        case "Mural":
            return .cyan
        case "Plaque":
            return .blue
        case "Sculpture":
            return .purple
        default:
            return .green
        }
    }
    var image: UIImage {
        guard let name = discipline else {
            return #imageLiteral(resourceName: "Flag")
        }
        switch name {
        case "Monument":
            return #imageLiteral(resourceName: "sculpture")
        case "Sculpture":
            return #imageLiteral(resourceName: "monument")
        case "Plaque":
            return #imageLiteral(resourceName: "plaque")
        case "Mural":
            return #imageLiteral(resourceName: "mural")
        default:
            return #imageLiteral(resourceName: "flag")
        }
    }
    
    init(
        title: String?,
        locationName: String?,
        discipline: String?,
        coordinate: CLLocationCoordinate2D
    ) {
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
    }
    
    init?(feature: MKGeoJSONFeature) {
        guard
            let point = feature.geometry.first as? MKPointAnnotation,
            let propertiesData = feature.properties,
            let json = try? JSONSerialization.jsonObject(with: propertiesData),
            let properties = json as? [String:Any]
        else{
            return nil
        }
        title = properties["title"] as? String
        locationName = properties["location"] as? String
        discipline = properties["discipline"] as? String
        coordinate = point.coordinate
        super.init()
    }
}
