//
//  ProductsAPIManager.swift
//  iOS
//
//  Created by Shubham Jitiya on 06/07/23.
//

import Foundation

final class ProductsAPIManager: ProductsNetworkManager {
    
    // MARK: Variables
    static let Shared = ProductsAPIManager()
    private init() { }
    
    func call<T: Codable>(_ requestType: ProductsRequestType,
                          body: Codable? = nil,
                          completionHandler: @escaping (Result<T, ProductsNetworkError>) -> Void) {
        
        var urlRequest = URLRequest(url: requestType.url)
        urlRequest.httpMethod = requestType.method.rawValue
        if let headers = requestType.headers {
            for (headerField, headerValue) in headers {
                urlRequest.setValue(headerValue, forHTTPHeaderField: headerField)
            }
        }
        if requestType.method != .get && requestType.method != .delete {
            guard let body else {
                completionHandler(.failure(.invalidResponse(R.string.localizable.emptyBody())))
                return
            }
            do {
                urlRequest.httpBody = try JSONEncoder().encode(body)
            } catch {
                completionHandler(.failure(.invalidResponse(R.string.localizable.somethingWentWrong())))
                return
            }
        }
        
        URLSession.shared.dataTask(with: urlRequest) { data, urlResponse, error in
            if let error {
                completionHandler(.failure(.networkError(error.localizedDescription)))
                return
            }
            guard let data, let httpResponse = urlResponse as? HTTPURLResponse else {
                completionHandler(.failure(.empty(R.string.localizable.noData())))
                return
            }
            guard 200...299 ~= httpResponse.statusCode else {
                completionHandler(.failure(.invalidStatusCode("\(R.string.localizable.clientOrServerError) \(httpResponse.statusCode)")))
                return
            }
            do {
                let responseData = try JSONDecoder().decode(T.self, from: data)
                completionHandler(.success(responseData))
                
            } catch {
                completionHandler(.failure(.failedDecoding("\(R.string.localizable.canNotConverData()) \(T.self)")))
                return
            }
        }.resume()
    }
    
    func downloadImage(urlRequest: URL, destinationURL: URL) {
        URLSession.shared.downloadTask(with: urlRequest) { (location, response, error) in
            if error != nil {
                return
            }
            guard let response = response as? HTTPURLResponse, 200 ...  299 ~= response.statusCode else {
                print("\(R.string.localizable.errorInResponseBody) \(String(describing: response))")
                return
            }
            if let location = location {
                do {
                    try FileManager.default.moveItem(at: location, to: destinationURL)
                    print(R.string.localizable.downloadCompleted)
                } catch(let error) {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
}
