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
        // Contacts app: Table view
        case contactsUserDataCell = "UserDataCell"
        case contactsSectionHeader = "SectionHeader"
    }
    
    enum Images: String {
        // System images
        case personCircleFilled = "person.crop.circle.fill"
        case plusCircleFill = "plus.circle.fill"
        case minusCircleFill = "minus.circle.fill"
        case speakerWaveOneFilled = "speaker.wave.1.fill"
        case speakerWaveTwoFilled = "speaker.wave.2.fill"
        case speakerWaveThreeFilled = "speaker.wave.3.fill"
        case placeHolderLandscape = "landscape_test_image"
        case logoPlaystation = "logo.playstation"
        case square = "square"
        case person = "person"
        case mail = "mail"
        case phone = "phone"
        case lock = "lock"
        case map = "map"
        // Grocery app
        case masalaMasti = "masala_masti"
    }
    
    enum Location: Double {
        // Aloha Waikiki
        case initialLatitude = 21.282778
        case initialLongitude = -157.829444
         // Oahu
        case oahuLatitude = 21.4765
        case oahuLongitude = -157.9647
        case regionRadius = 1000
        // Distance range
        case initialRange = 800
        case constrainLatitude = 50000
        case constrainLongitude = 60000
        case maxCoordinate = 200000
    }
    
    enum StringConstants: String {
        case contactsSectionZeroHeaderTitle = "Newly added"
        case contactsSectionFirstHeaderTitle = "Recently deleted"
        case orangeCategoryTvMovies = "Watch next TV & Movies"
        case orangeCategoryTeluguMovies = "Telugu Movies"
        case collectionViewBasicElementaryTitle = "Images section"
        case alertActionCamera = "Camera"
        case alertActionLibrary = "Library"
        case alertActionCancel = "Cancel"
        case validationAlphabets = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        case validationNumbers = "0123456789"
        case companyTitle = "Google Inc."
        case footerSection = "Footer Section"
        case dateFormat = "MM/dd/yyyy"
        case googleUrl = "https://www.google.com/"
    }
}
