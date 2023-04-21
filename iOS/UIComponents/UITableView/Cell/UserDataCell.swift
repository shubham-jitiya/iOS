//
//  UserDataCell.swift
//  iOS
//
//  Created by Shubham Jitiya on 01/05/23.
//

import UIKit

class UserDataCell: UITableViewCell {

    // MARK: IB outlets
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lbFullName: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// MARK: Functions
extension UserDataCell {
    func configCell(data: UserModel) {
        guard let img = data.imgProfile, let firstName = data.fName, let lastName = data.lName, let age = data.age else {
            return
        }
        imgProfile.image = img
        lbFullName.text = "\(firstName) \(lastName)"
        lblAge.text = "\(age)"
        imgProfile.layer.cornerRadius = imgProfile.frame.size.height / 2.0
    }
}
