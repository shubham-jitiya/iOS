//
//  ProductsTableViewCell.swift
//  iOS
//
//  Created by Shubham Jitiya on 05/07/23.
//

import UIKit
import Kingfisher

class ProductsTableViewCell: UITableViewCell {
    
    // MARK: Outlets
    @IBOutlet private weak var lblProductTitle: UILabel!
    @IBOutlet private weak var lblProductCategory: UILabel!
    @IBOutlet private weak var btnProductRatings: UIButton!
    @IBOutlet private weak var lblProductDescription: UILabel!
    @IBOutlet private weak var lblProductPrice: UILabel!
    @IBOutlet private weak var btnProductBuy: UIButton!
    @IBOutlet private weak var imageViewProduct: UIImageView!
    
    // MARK: Variables
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// MARK: Methods
extension ProductsTableViewCell {
    func config(data: Item) {
        lblProductTitle.text = data.title
        lblProductCategory.text = data.category
        btnProductRatings.titleLabel?.text = String(data.rating)
        lblProductDescription.text = data.description
        lblProductPrice.text = String("₹ \(data.price)")
        imageViewProduct.kf.setImage(with: URL(string: data.images.first ?? ""))
    }
}


