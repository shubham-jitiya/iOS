//
//  EvenTableViewCell.swift
//  iOS
//
//  Created by Shubham Jitiya on 28/04/23.
//

import UIKit

class EvenTableViewCell: UITableViewCell {

    // MARK: IB outlets
    @IBOutlet weak var lblContent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
