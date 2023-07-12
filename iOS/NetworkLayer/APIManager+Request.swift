//
//  APIManager+Request.swift
//  Nestlings
//
//  Created by Simform Solutions on 08/02/21.
//  Copyright © 2021 Simform Solutions Pvt. Ltd.. All rights reserved.
//

import Alamofire

struct UploadFileRequest {
    var fileData: Data
    var fileName: String
    var mimeType: String
    var paramName: String
}

/// Mime Type
enum MimeType: String {
    case jpegImage = "jpeg"
    case pngImage = "png"
    case jpgImage = "jpg"
    case pdf = "pdf"
    case applicationJSON = "json"
    
    func getMimeType() -> String {
        switch self {
        case .jpegImage: return "image/jpeg"
        case .pngImage: return "image/png"
        case .jpgImage: return "image/jpg"
        case .pdf: return "application/pdf"
        case .applicationJSON: return "application/json"
        }
    }
}

// MARK: Enums
enum RequestItemsType: Equatable {
    case getProducts(noOfProducts: Int, skip: Int)
}

// MARK: Extensions
// MARK: EndPointType
extension RequestItemsType: EndPointType {
    
    // MARK: Vars & Lets
    var baseURL: String {
        switch self {
        case .getProducts:
            return AppConstant.serverURL
        }
    }
    
    var version: String {
        switch self {
        case .getProducts:
            return ""
        }
    }
    
    var path: String {
        switch self {
        case .getProducts(let noOfProducts, let skip):
            return "/products?limit=\(noOfProducts)&skip=\(skip)"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .getProducts:
            return .get
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .getProducts:
            return nil
        }
    }
    
    var url: URL {
        return URL(string: self.baseURL + self.version + self.path.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!)!
    }
    
    var encoding: ParameterEncoding {
        switch self {
        default:
            return JSONEncoding.default
        }
    }
}
