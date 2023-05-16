//
//  Validation.swift
//  iOS
//
//  Created by Shubham Jitiya on 02/05/23.
//

import Foundation
import CoreLocation

struct Constants {
    enum Cells: String {
        // Table view: constacts app
        case USER_DATA_CELL = "UserDataCell"
        case SECTION_HEADER = "SectionHeader"
        case SECTION_FOOTER = "SectionFooter"
    }
    
    enum Images: String {
        // System images
        case PERSON_FILLED = "person.crop.circle.fill"
    }
    
    enum Location: Double {
        // Aloha Waikiki
        case INITIAL_LATITUDE = 21.282778
        case INITIAL_LONGITUDE = -157.829444
         // Oahu
        case OAHU_LATITUDE = 21.4765
        case OAHU_LONGITUDE = -157.9647
        case REGION_RADIUS = 1000
        // Distance range
        case INITIAL_RANGE = 800
        case CONSTRAIN_LATITUDE = 50000
        case CONSTRAIN_LONGITUDE = 60000
        case MAX_COORDINATE = 200000
    }
}
