//
//  ProductsNetworkError.swift
//  iOS
//
//  Created by Shubham Jitiya on 06/07/23.
//

import Foundation

enum ProductsNetworkError: Error {
    case networkError(_ message: String? = nil)
    case invalidStatusCode(_ message: String? = nil)
    case invalidResponse(_ message: String? = nil)
    case failedDecoding(_ message: String? = nil)
    case empty(_ message: String? = nil)
}
