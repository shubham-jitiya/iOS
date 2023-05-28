//
//  GroceryItemCollectionViewCell.swift
//  iOS
//
//  Created by Shubham on 28/05/23.
//

import UIKit

class GroceryItemCollectionViewCell: UICollectionViewCell {
    // MARK: Variables
    static let reuseIdentifier = "GroceryItemCollectionViewCell"

    
    // MARK: IB outlets
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet private weak var name: UILabel!
    @IBOutlet private weak var weight: UILabel!
    @IBOutlet private weak var price: UILabel!
    @IBOutlet private weak var btnAdd: UIButton!
}

// MARK: Functions
extension GroceryItemCollectionViewCell {
    func config(item: GroceryItem) {
        self.imgView = item.imgView
        self.name.text = item.name
        self.weight.text = item.weight
        self.price.text = item.price
        self.btnAdd.setTitle(item.btnTitle, for: .normal)
    }
}
