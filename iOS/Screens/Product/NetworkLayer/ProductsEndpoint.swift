//
//  ProductsEndpoint.swift
//  iOS
//
//  Created by Shubham Jitiya on 06/07/23.
//

import Foundation

protocol ProductsEndpoint {
    var baseUrl: String { get }
    var path: String { get }
    var version: String { get }
    var method: ProductsRequestMethods { get }
    var url: URL { get }
    var headers: [String : String]? { get }
}
