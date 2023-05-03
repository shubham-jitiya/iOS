//
//  VCListContacts.swift
//  iOS
//
//  Created by Shubham Jitiya on 01/05/23.
//

import UIKit

// MARK: Protocol - User data
extension VCListContacts: UserDataDelegate {
    func userInfo(_ data: UserModel) {
        usersList.newlyAdded.append(data)
        usersList.newlyAdded.sort(by: { $0.fName ?? "" < $1.fName ?? ""} )
        tblContacts.reloadData()
    }
}

class VCListContacts: UIViewController {
    // MARK: Variables
    private var usersList: (newlyAdded: Array<UserModel>, recentlyDeleted: Array<UserModel>) = ([], [])
    
    // MARK: IB outlets
    @IBOutlet weak var tblContacts: UITableView!
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        // dummyData()
    }
}

// MARK: Functions
extension VCListContacts {
    private func initialSetup() {
        tblContacts.sectionHeaderTopPadding = 0
        initialiseNavigationController()
        registerCells()
    }
    
    private func initialiseNavigationController() {
        // add btn
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
            UINib(nibName: Constants.Cells.USER_DATA_CELL.rawValue, bundle: nil),
            forCellReuseIdentifier: Constants.Cells.USER_DATA_CELL.rawValue)
        //custom section header-footer
        tblContacts.register(
            UINib(nibName: Constants.Cells.SECTION_HEADER.rawValue, bundle: nil),
            forHeaderFooterViewReuseIdentifier: Constants.Cells.SECTION_HEADER.rawValue)
        tblContacts.register(
            UINib(nibName: Constants.Cells.SECTION_FOOTER.rawValue, bundle: nil),
            forHeaderFooterViewReuseIdentifier: Constants.Cells.SECTION_FOOTER.rawValue)
    }
    
    private func dummyData() {
        let newUsers = [
            UserModel(imgProfile: UIImage(systemName: "person.crop.circle.fill"), fName: "Shubham", lName: "Jitiya", age: "21"),
            UserModel(imgProfile: UIImage(systemName: "person.crop.circle.fill"), fName: "Ankit", lName: "Verma", age: "21"),
            UserModel(imgProfile: UIImage(systemName: "person.crop.circle.fill"), fName: "Ankit", lName: "Verma", age: "21"),
            UserModel(imgProfile: UIImage(systemName: "person.crop.circle.fill"), fName: "Ankit", lName: "Verma", age: "21"),
            UserModel(imgProfile: UIImage(systemName: "person.crop.circle.fill"), fName: "Ankit", lName: "Verma", age: "21"),
            UserModel(imgProfile: UIImage(systemName: "person.crop.circle.fill"), fName: "Ankit", lName: "Verma", age: "21"),
            UserModel(imgProfile: UIImage(systemName: "person.crop.circle.fill"), fName: "Ankit", lName: "Verma", age: "21"),
            UserModel(imgProfile: UIImage(systemName: "person.crop.circle.fill"), fName: "Ankit", lName: "Verma", age: "21"),
        ]
        let deletedUsers = [
            UserModel(imgProfile: UIImage(systemName: "person.crop.circle.fill"), fName: "Tirth", lName: "Purohit", age: "21"),
            UserModel(imgProfile: UIImage(systemName: "person.crop.circle.fill"), fName: "Tirth", lName: "Purohit", age: "21"),
            UserModel(imgProfile: UIImage(systemName: "person.crop.circle.fill"), fName: "Tirth", lName: "Purohit", age: "21"),
            UserModel(imgProfile: UIImage(systemName: "person.crop.circle.fill"), fName: "Tirth", lName: "Purohit", age: "21"),
            UserModel(imgProfile: UIImage(systemName: "person.crop.circle.fill"), fName: "Tirth", lName: "Purohit", age: "21"),
            UserModel(imgProfile: UIImage(systemName: "person.crop.circle.fill"), fName: "Tirth", lName: "Purohit", age: "21"),
            UserModel(imgProfile: UIImage(systemName: "person.crop.circle.fill"), fName: "Tirth", lName: "Purohit", age: "21"),
            UserModel(imgProfile: UIImage(systemName: "person.crop.circle.fill"), fName: "Tirth", lName: "Purohit", age: "21"),
            UserModel(imgProfile: UIImage(systemName: "person.crop.circle.fill"), fName: "Tirth", lName: "Purohit", age: "21"),
            UserModel(imgProfile: UIImage(systemName: "person.crop.circle.fill"), fName: "Tirth", lName: "Purohit", age: "21"),
            UserModel(imgProfile: UIImage(systemName: "person.crop.circle.fill"), fName: "Tirth", lName: "Purohit", age: "21"),
            UserModel(imgProfile: UIImage(systemName: "person.crop.circle.fill"), fName: "Tirth", lName: "Purohit", age: "21"),
            UserModel(imgProfile: UIImage(systemName: "person.crop.circle.fill"), fName: "Tirth", lName: "Purohit", age: "21"),
            UserModel(imgProfile: UIImage(systemName: "person.crop.circle.fill"), fName: "Tirth", lName: "Purohit", age: "21"),
            UserModel(imgProfile: UIImage(systemName: "person.crop.circle.fill"), fName: "Tirth", lName: "Purohit", age: "21"),
        ]
        usersList.newlyAdded = newUsers
        usersList.recentlyDeleted = deletedUsers
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
            switch section {
            case 0:
                return usersList.newlyAdded.count
            case 1:
                return usersList.recentlyDeleted.count
            default:
                return 0
            }
        }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let userDataCell = tblContacts.dequeueReusableCell(
                withIdentifier: Constants.Cells.USER_DATA_CELL.rawValue) as? UserDataCell else {
                return UITableViewCell()
            }
            userDataCell.imgProfile.layer.cornerRadius = userDataCell
                .imgProfile
                .frame
                .size.height / 2.0
            // Disabled selection for recently deleted
    
            if indexPath.section == 0 {
                let data = usersList.newlyAdded[indexPath.row]
                userDataCell.selectionStyle = .default
                userDataCell.configCell(data: data)
            } else if indexPath.section == 1 {
                let data = usersList.recentlyDeleted[indexPath.row]
                userDataCell.selectionStyle = .none
                userDataCell.configCell(data: data)
            }
            return userDataCell
        }
    
    func tableView(
        _ tableView: UITableView,
        viewForHeaderInSection section: Int) -> UIView? {
            guard let customSectionHeader = tblContacts.dequeueReusableHeaderFooterView(
                withIdentifier: Constants.Cells.SECTION_HEADER.rawValue) as? SectionHeader else {
                return nil
            }
            customSectionHeader.lblSectionHeader.textColor = .white
            if section == 0 && !usersList.newlyAdded.isEmpty {
                customSectionHeader.lblSectionHeader.text = "Newly added"
                return customSectionHeader
            }
            if section == 1 && !usersList.recentlyDeleted.isEmpty{
                customSectionHeader.lblSectionHeader.text = "Recently deleted"
                return customSectionHeader
            }
            return nil
        }
    
    func tableView(
        _ tableView: UITableView,
        heightForHeaderInSection section: Int) -> CGFloat {
            if section == 0 && usersList.newlyAdded.isEmpty {
            return 0
        }
        if section == 1 && usersList.recentlyDeleted.isEmpty {
            return 0
        }
        return UITableView.automaticDimension
    }
}

extension VCListContacts: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if indexPath == IndexPath(row: indexPath.row, section: 0) {
            return .delete
        } else {
            return .none
        }
    }
    func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath) {
        tableView.beginUpdates()
        let deletedItem = usersList.newlyAdded.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        tableView.endUpdates()
        usersList.recentlyDeleted.append(deletedItem)
        tblContacts.insertRows(at: [IndexPath(row: 0, section: 1)], with: .left)
        print(usersList.newlyAdded)
        print(usersList.recentlyDeleted)
        print(indexPath)
        //tblContacts.reloadData()
    }
    
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath) {
            tblContacts.deselectRow(at: indexPath, animated: true)
    }
}



