//
//  CompanyModel.swift
//  iOS
//
//  Created by Shubham Jitiya on 28/04/23.
//

import Foundation

struct CompanyModel {
    // MARK: Variables
    let companyLogo: String?, companyName: String?
    var isSelected: Bool = false
    
    // MARK: Functions
    static func getCompanyDetails() -> [CompanyModel] {
        return [
            CompanyModel(companyLogo: "logo.playstation", companyName: "Google Inc."),
            CompanyModel(companyLogo: "logo.playstation", companyName: "Google Inc."),
            CompanyModel(companyLogo: "logo.playstation", companyName: "Google Inc."),
            CompanyModel(companyLogo: "logo.playstation", companyName: "Google Inc."),
            CompanyModel(companyLogo: "logo.playstation", companyName: "Google Inc."),
            CompanyModel(companyLogo: "logo.playstation", companyName: "Google Inc."),
            CompanyModel(companyLogo: "logo.playstation", companyName: "Google Inc."),
          
        ]
    }
}
