//
//  Shop.swift
//  iOS
//
//  Created by Shubham Jitiya on 04/07/23.
//

import Foundation

// MARK: - Shop
struct Shop: Codable {
    let products: [Item]
    let total, skip, limit: Int
}

// MARK: - Product
struct Item: Codable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
}
