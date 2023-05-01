//
//  VCListContacts.swift
//  iOS
//
//  Created by Shubham Jitiya on 01/05/23.
//

import UIKit

class VCListContacts: UIViewController {
    // MARK: Variables
    private var usersList: (Array<UserModel>, Array<UserModel>) = ([], [])
    
    // MARK: IB outlets

    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialiseNavigationController()
    }
}

// MARK: Functions
extension VCListContacts {
    private func initialiseNavigationController() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addContact))
    }
    
    @objc private func addContact() {
        guard let navigateAddContact = UIStoryboard(
            name: "UIAddContacts", bundle: nil)
            .instantiateViewController(withIdentifier: "VCAddContacts") as? VCAddContacts else {
            return
        }
        navigateAddContact.userData = self
        navigationController?.pushViewController(navigateAddContact, animated: true)
    }
}

// MARK: Protocol - User data
extension VCListContacts: UserDataDelegate {
    func userInfo(data: UserModel) {
//        lblTestDelegate.text = "\(data.fName)"
//        imgTestDelegate.image = data.userProfile
        print("User found: \(data.imgProfile)")
    }
}
