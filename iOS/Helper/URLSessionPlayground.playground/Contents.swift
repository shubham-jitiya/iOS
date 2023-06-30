import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

// MARK: - GET request
// Get data without decodable
func getData() {
    guard let serviceUrl = URL(string: "https://api.coindesk.com/v1/bpi/currentprice.json") else {
        return
    }
    URLSession.shared.dataTask(with: serviceUrl) { (serviceData, serviceResponse, error) in
        if(error != nil) {
            print("Error: \(String(describing: error?.localizedDescription))")
            return
        }
        guard let httpResponse = serviceResponse as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode  else {
            return
        }
        if(httpResponse.statusCode == 200) {
            if let serviceData {
                let jsonData = try? JSONSerialization.jsonObject(with: serviceData, options: .mutableContainers)
                guard let data = jsonData as? Dictionary<String, Any>, let time = data["time"] else {
                    return
                }
                print(time)
            }
        } else {
            print(httpResponse.statusCode)
        }
    }.resume()
}
getData()


// MARK: - Using Encodable - Decodable
// MARK: - Shop
struct Shop: Decodable {
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

// MARK: - POST Request
struct EndPoints {
    static let registerUser = "https://dummy.restapiexample.com/api/v1/create"
    static let getProducts = "https://dummyjson.com/products"
}

struct User {
    func registerUser() {
        guard let postURL = URL(string: EndPoints.registerUser) else {
            return
        }
        var urlRequest = URLRequest(url: postURL)
        urlRequest.httpMethod = "post"
        let data = ["Name": "Laptop"]
        do {
            let requestBody = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
            urlRequest.httpBody = requestBody
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        } catch let error {
            print(error.localizedDescription)
        }
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if(error != nil) {
                print("Error: \(String(describing: error?.localizedDescription))")
                return
            }
            guard let data,
                  !data.isEmpty,
                  let responseData = String(data: data, encoding: .utf8) else {
                return
            }
            print(responseData)
        }.resume()
    }
    
    // get data with decodable
    func getShopWithDecodable() {
        guard let serviceUrl = URL(string: EndPoints.getProducts) else {
            return
        }
        URLSession.shared.dataTask(with: serviceUrl) { (serviceData, serviceResponse, error) in
            if(error != nil) {
                print("Error")
                return
            }
            guard let httpResponse = serviceResponse as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode  else {
                return
            }
            if(httpResponse.statusCode == 200) {
                if let serviceData {
                    guard let jsonData = try? JSONDecoder().decode(Shop.self, from: serviceData) else {
                        return
                    }
                    print(jsonData.products.first?.category ?? "Empty")
                }
            } else {
                print(httpResponse.statusCode)
            }
        }.resume()
    }
}

let newUser = User()
newUser.registerUser()
newUser.getShopWithDecodable()
