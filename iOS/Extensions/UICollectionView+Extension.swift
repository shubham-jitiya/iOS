//
//  UICollectionView+Extension.swift
//  iOS
//
//  Created by Shubham Jitiya on 09/05/23.
//

import UIKit

// MARK: Properties
public extension UICollectionReusableView {
    static var identifier: String {
        return String(describing: self)
    }
}

// MARK: Functions
public extension UICollectionView {
    func registerCell(type: UICollectionViewCell.Type, identifier: String? = nil) {
        let cellId = String(describing: type)
        register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: identifier ?? cellId)
    }
    
    func dequeueCell<T: UICollectionViewCell>(
        withType type: UICollectionViewCell.Type,
        for indexPath: IndexPath) -> T? {
            return dequeueReusableCell(withReuseIdentifier: type.identifier, for: indexPath) as? T
        }
}
