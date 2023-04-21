//
//  Helper.swift
//  iOS
//
//  Created by Shubham Jitiya on 16/05/23.
//

import Foundation
import MapKit

struct Helper {
    
}

// MARK: Functions
extension Helper {
    static func getGridData() -> [String] {
        return [
            "Title 1",
            "Title 2",
            "Title 3",
            "Title 4",
            "Title 5",
            "Title 5",
            "Title 5",
            "Title 5",
            "Title 5",
            "Title 5",
            "Title 5",
            "Title 5",
            "Title 5",
            "Title 5",
            "Title 5",
            "Title 5",
            "Title 5",
            "Title 5",
            "Title 5",
            "Title 5",
            "Title 5",
            "Title 5",
        ]
    }
    
    static func getItems() -> [String] {
        return ["Item 1", "Item 2", "Item 3",  "Item 4"]
    }
    
    static func getWeekdays() -> [String] {
        return ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    }
    
    static func getMonths() -> [String] {
        return ["Jan", "Feb", "March", "Apr", "May", "Jun", "Jul", "Aug", "Sept", "Oct", "Nov", "Dec"]
    }
    
    static func getCities() -> [String] {
        return ["New York, NY", "Los Angeles, CA", "Chicago, IL", "Houston, TX",
                            "Philadelphia, PA", "Phoenix, AZ", "San Diego, CA", "San Antonio, TX",
                            "Dallas, TX", "Detroit, MI", "San Jose, CA", "Indianapolis, IN",
                            "Jacksonville, FL", "San Francisco, CA", "Columbus, OH", "Austin, TX",
                            "Memphis, TN", "Baltimore, MD", "Charlotte, ND", "Fort Worth, TX"]
    }
    
    static func jsonDecodeArtwork(json: Json) -> [Artwork] {
        guard
            let fileName = Bundle.main.url(forResource: json.fileName, withExtension: json.fileExtension),
            let artworkData = try? Data(contentsOf: fileName) else {
            return []
        }
        do {
            let features = try MKGeoJSONDecoder()
                .decode(artworkData)
                .compactMap{ $0 as? MKGeoJSONFeature }
            let validWorks = features.compactMap(Artwork.init)
            return validWorks
        } catch {
            print("Unexpected error: ", error)
            return []
        }
    }
}

// MARK: Json
extension Helper {
    enum Json: String {
        case publicArt = "PublicArt"
        var fileName: String {
            return rawValue
        }
        var fileExtension: String {
            return "geojson"
        }
    }
}
