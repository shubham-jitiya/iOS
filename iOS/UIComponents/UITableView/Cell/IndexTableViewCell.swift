//
//  IndexTableViewCell.swift
//  iOS
//
//  Created by Shubham Jitiya on 28/04/23.
//

import UIKit

class IndexTableViewCell: UITableViewCell {

    // MARK: Variables
    static let reuseIdentifier = "IndexTableViewCell"
    
    // MARK: IB outlets
    @IBOutlet weak var lblIndex: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// MARK: Functions
extension IndexTableViewCell {
    func config(text: String) {
        lblIndex.text = text
    }
    
    static func getNib() -> UINib {
        return UINib(nibName: reuseIdentifier, bundle: nil)
    }
}
