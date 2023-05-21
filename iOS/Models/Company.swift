//
//  CompanyModel.swift
//  iOS
//
//  Created by Shubham Jitiya on 28/04/23.
//

import Foundation

struct Company {
    // MARK: Variables
    let companyLogo: String?, companyName: String?
    var isSelected: Bool = false
    
    // MARK: Functions
    static func getCompanyDetails() -> [Company] {
        return [
            Company(companyLogo: Constants.Images.logoPlaystation.rawValue, companyName: Constants.StringConstants.companyTitle.rawValue),
            Company(companyLogo: Constants.Images.logoPlaystation.rawValue, companyName: Constants.StringConstants.companyTitle.rawValue),
            Company(companyLogo: Constants.Images.logoPlaystation.rawValue, companyName: Constants.StringConstants.companyTitle.rawValue),
            Company(companyLogo: Constants.Images.logoPlaystation.rawValue, companyName: Constants.StringConstants.companyTitle.rawValue),
            Company(companyLogo: Constants.Images.logoPlaystation.rawValue, companyName: Constants.StringConstants.companyTitle.rawValue),
            Company(companyLogo: Constants.Images.logoPlaystation.rawValue, companyName: Constants.StringConstants.companyTitle.rawValue),
            Company(companyLogo: Constants.Images.logoPlaystation.rawValue, companyName: Constants.StringConstants.companyTitle.rawValue),
        ]
    }
}
