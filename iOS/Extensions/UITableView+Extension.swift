//
//  UITableView+Extension.swift
//  iOS
//
//  Created by Shubham Jitiya on 09/05/23.
//

import UIKit

// MARK: Properties
public extension UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}

// MARK: Functions
extension UITableView {
    func registerCell<T: UITableViewCell>(type: T.Type, identifier: String? = nil) {
        let cellId = String(describing: type)
        register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: identifier ?? cellId)
    }
    
    func dequeueCell<T: UITableViewCell> (
        withType type: UITableViewCell.Type) -> T? {
            return dequeueReusableCell(withIdentifier: type.identifier) as? T
        }
    
    func dequeueCell<T: UITableViewCell>(
        withType type: UITableViewCell.Type,
        for indexPath: IndexPath) -> T? {
            return dequeueReusableCell(withIdentifier: type.identifier, for: indexPath) as? T
        }
}
