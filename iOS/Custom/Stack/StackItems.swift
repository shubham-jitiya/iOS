//
//  StackItems.swift
//  iOS
//
//  Created by Shubham on 12/05/23.
//

import UIKit

class StackItems: UIView {
    
    // MARK: Variables
    static let identifier = "StackItems"
    
    // MARK: IB outlets
    @IBOutlet weak var imgIsSelected: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!

}

extension StackItems {
    func config(_ data: String) {
        lblTitle.text = data
    }
}
