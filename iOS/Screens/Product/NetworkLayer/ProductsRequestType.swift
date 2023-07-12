//
//  ProductsRequestType.swift
//  iOS
//
//  Created by Shubham Jitiya on 06/07/23.
//

import Foundation

enum ProductsRequestType {
    case getProducts(noOfProducts: Int, skip: Int)
}

// MARK: - Methods
extension ProductsRequestType: ProductsEndpoint {
    var baseUrl: String {
        return AppConstant.serverURL
    }
    
    var path: String {
        switch self {
        case .getProducts(let noOfProducts, let skip):
            return "/products?limit=\(noOfProducts)&skip=\(skip)"
        }
    }
    
    var version: String {
        switch self {
        case .getProducts:
            return ""
        }
    }
    
    var method: ProductsRequestMethods {
        switch self {
        case .getProducts:
            return .get
        }
    }
    
    var url: URL {
        return URL(string: self.baseUrl + self.version + self.path.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!)!
    }
    
    var headers: [String : String]? {
        switch self {
        default: return nil
        }
    }
}
