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
        guard let url = Bundle.main.url(forResource: "MoviesJson", withExtension: "json"),
              let jsonData = try? Data(contentsOf: url) else {
            print("Error loading MovieJson.json")
            return []
        }
        do {
            return try JSONDecoder().decode([Movie].self, from: jsonData)
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
}
