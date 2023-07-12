//
//  File.swift
//  iOS
//
//  Created by Shubham Jitiya on 04/07/23.
//

import Foundation

class ProductsViewModel {
    var shop = Dynamic([Item]())
    var shopFiltered = Dynamic([Item]())
    
    init() {
        fetchProducts()
    }
    
    func fetchProducts() {
        ProductsAPIManager.Shared.call(.getProducts(noOfProducts: 15, skip: 0)) { [weak self]
            (completionHandler: Swift.Result<Shop, ProductsNetworkError>) in
            guard let self else { return }
            switch completionHandler {
            case .failure(let error):
                print(error)
            case .success(let success):
                self.shop.value = success.products
                self.shopFiltered.value = success.products
            }
        }
    }
    
    func filterProducts(query: String) {
        if(!query.isEmpty) {
            shopFiltered.value = shop.value.filter { item in
                item.title.lowercased().contains(query.lowercased())
            }
            print(shopFiltered.value)
        } else {
            shopFiltered.value = shop.value
        }
    }
    
    func downloadImage() {
        let fileName = "ProductImage.jpg"
        let documentsDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let destinationURL = documentsDir?.appendingPathComponent(fileName)
        guard let destinationURL, let urlRequest = URL(string: shopFiltered.value.first?.images.first ?? "") else {
            return
        }
        ProductsAPIManager.Shared.downloadImage(urlRequest: urlRequest, destinationURL: destinationURL)
    }
}
