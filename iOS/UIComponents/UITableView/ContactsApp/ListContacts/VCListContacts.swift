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
    @IBOutlet weak var tblContacts: UITableView!
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialiseNavigationController()
        registerCells()
        if #available(iOS 15.0, *) {
            tblContacts.sectionHeaderTopPadding = 0
        }
//        tblContacts.automaticallyAdjustsScrollIndicatorInsets = false
//        tblContacts.contentInsetAdjustmentBehavior = .never
        //dummyData()
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
    
    private func registerCells() {
        tblContacts.register(
            UINib(nibName: Constants.USER_DATA_CELL.rawValue, bundle: nil),
            forCellReuseIdentifier: "UserDataCell")
        //custom section header-footer
        tblContacts.register(
            UINib(nibName: Constants.SECTION_HEADER.rawValue, bundle: nil),
            forHeaderFooterViewReuseIdentifier: Constants.SECTION_HEADER.rawValue)
        tblContacts.register(
            UINib(nibName: Constants.SECTION_FOOTER.rawValue, bundle: nil),
            forHeaderFooterViewReuseIdentifier: Constants.SECTION_FOOTER.rawValue)
    }
    
    private func dummyData() {
        let newlyAdded = [
            UserModel(imgProfile: UIImage(systemName: "person.crop.circle.fill"), fName: "Shubham", lName: "Jitiya", age: "21"),
            UserModel(imgProfile: UIImage(systemName: "person.crop.circle.fill"), fName: "Ankit", lName: "Verma", age: "21"),
        ]
        let recentlyDeleted = [
            UserModel(imgProfile: UIImage(systemName: "person.crop.circle.fill"), fName: "Tirth", lName: "Purohit", age: "21"),
        ]
        
        usersList.0 = newlyAdded
        usersList.1 = recentlyDeleted
    }
}

// MARK: Delegate - Table Datasource
extension VCListContacts: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            if section == 0 {
                return usersList.0.count
            } else {
                return usersList.1.count
            }
        }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let userDataCell = tblContacts.dequeueReusableCell(
                withIdentifier: Constants.USER_DATA_CELL.rawValue) as? UserDataCell else {
                return UITableViewCell()
            }
            userDataCell.imgProfile.layer.cornerRadius = userDataCell
                .imgProfile
                .frame
                .size.height / 2.0
            
            if indexPath.section == 0 {
                let data = usersList.0[indexPath.row]
                userDataCell.configCell(data: data)
            } else if indexPath.section == 1 {
                let data = usersList.1[indexPath.row]
                userDataCell.configCell(data: data)
            }
            return userDataCell
        }
    
    func tableView(
        _ tableView: UITableView,
        viewForHeaderInSection section: Int) -> UIView? {
            guard let customSectionHeader = tblContacts.dequeueReusableHeaderFooterView(
                withIdentifier: Constants.SECTION_HEADER.rawValue) as? SectionHeader else {
                return nil
            }
            
            if section == 0 && usersList.0.count != 0 {
                customSectionHeader.lblSectionHeader.text = "Newly added"
            } else {
                customSectionHeader.lblSectionHeader.text = ""
            }
            if section == 1 && usersList.1.count != 0 {
                customSectionHeader.lblSectionHeader.text = "Recently deleted"
            }
            return customSectionHeader
        }
}

extension VCListContacts: UITableViewDelegate {
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if indexPath == IndexPath(row: indexPath.row, section: 0) {
            return .delete
        } else {
            return .none
            
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        tableView.beginUpdates()
        let deletedItem = usersList.0.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        tableView.endUpdates()
        usersList.1.append(deletedItem)
        tblContacts.reloadData()
    }
    
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath) {
            tblContacts.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: Protocol - User data
extension VCListContacts: UserDataDelegate {
    func userInfo(_ data: UserModel) {
        usersList.0.append(data)
        usersList.0.sort(by: {$0.fName ?? "" < $1.fName ?? ""})
//        usersList.0.sort(by: {
//            guard let elementFirst = $0.fName, let elementSecond = $1.fName else {
//                return false
//            }
//            return elementFirst < elementSecond
//        })
        tblContacts.reloadData()
    }
}

