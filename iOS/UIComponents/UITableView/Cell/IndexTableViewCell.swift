//
//  IndexTableViewCell.swift
//  iOS
//
//  Created by Shubham Jitiya on 28/04/23.
//

import UIKit

class IndexTableViewCell: UITableViewCell {

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
