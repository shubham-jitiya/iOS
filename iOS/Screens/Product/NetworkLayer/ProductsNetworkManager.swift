//
//  ProductsNetworkManager.swift
//  iOS
//
//  Created by Shubham Jitiya on 06/07/23.
//

import Foundation

protocol ProductsNetworkManager {
    func call<T>(_ requestType: ProductsRequestType,
                    body: Codable?,
                    completionHandler: @escaping (Result<T, ProductsNetworkError>) -> Void) where T: Codable
}
