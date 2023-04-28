//
//  CompanyTableViewCell.swift
//  iOS
//
//  Created by Shubham Jitiya on 28/04/23.
//

import UIKit

class CompanyTableViewCell: UITableViewCell {

    // MARK: IB outlets
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var lblCompanyName: UILabel!
    @IBOutlet weak var imgSelect: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgSelect.layer.cornerRadius = imgSelect.frame.size.height / 2.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// MARK: Functions
extension CompanyTableViewCell {
    func configCell(data: CompanyModel) {
        imgLogo.image = UIImage(systemName: data.companyLogo ?? "speaker")
        lblCompanyName.text = data.companyName
        if data.isSelected {
            imgSelect.backgroundColor = .red
        } else {
            imgSelect.backgroundColor = .blue
        }
    }
}
