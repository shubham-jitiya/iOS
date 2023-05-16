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

// MARK: Functions - Json decoder
extension Helper {
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
