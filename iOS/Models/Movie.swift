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
    
    static func loadJson() -> [Movie] {
        let decoder = JSONDecoder()
        do {
            let contents = try decoder.decode([Movie].self, from: jsonData)
            return contents
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
}
