//
//  Movie.swift
//  iOS
//
//  Created by Shubham Jitiya on 05/05/23.
//

import Foundation

struct Movie: Codable {
    let title, year, runtime: String
    let poster: String?

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case runtime = "Runtime"
        case poster = "Poster"
    }
}
