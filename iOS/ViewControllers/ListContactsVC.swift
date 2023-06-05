//
//  VCListContacts.swift
//  iOS
//
//  Created by Shubham Jitiya on 01/05/23.
//

import UIKit

class ListContactsVC: UIViewController {
    // MARK: Variables
    private var usersList: (newlyAdded: Array<UserModel>, recentlyDeleted: Array<UserModel>) = ([], [])
    
    // MARK: IB outlets
    @IBOutlet private weak var tblContacts: UITableView!
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
}

// MARK: Functions
extension ListContactsVC {
    private func initialSetup() {
        tblContacts.sectionHeaderTopPadding = 0
        setupNavigationBarItems()
        registerCells()
        handleEmptyList()
    }
    
    private func setupNavigationBarItems() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(btnAddContact))
    }
    
    @objc private func btnAddContact() {
        guard let vcAddContacts = AddContactsVC.create(storyboardName: .uiAddContacts) as? AddContactsVC else {
            return
        }
        vcAddContacts.userDataDelegate = self
        navigate(to: vcAddContacts)
    }
    
    private func registerCells() {
        tblContacts.register(
            UINib(nibName: Constants.Cells.contactsUserDataCell.rawValue, bundle: nil),
            forCellReuseIdentifier: Constants.Cells.contactsUserDataCell.rawValue)
        tblContacts.register(
            UINib(nibName: Constants.Cells.contactsSectionHeader.rawValue, bundle: nil),
            forHeaderFooterViewReuseIdentifier: Constants.Cells.contactsSectionHeader.rawValue)
    }
    
    private func handleEmptyList() {
        if usersList.newlyAdded.isEmpty && usersList.recentlyDeleted.isEmpty {
            print("List is empty - Please add some contacts to see here!!")
            return
        }
    }
}

// MARK: Delegate - Table Datasource
extension ListContactsVC: UITableViewDataSource {
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
                withIdentifier: Constants.Cells.contactsUserDataCell.rawValue) as? UserDataCell else {
                return UITableViewCell()
            }
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
                withIdentifier: Constants.Cells.contactsSectionHeader.rawValue) as? SectionHeader else {
                return nil
            }
            customSectionHeader.configure()
            if section == 0 && !usersList.newlyAdded.isEmpty {
                customSectionHeader.lblSectionHeader.text = Constants.StringConstants.contactsSectionZeroHeaderTitle.rawValue
                return customSectionHeader
            }
            if section == 1 && !usersList.recentlyDeleted.isEmpty{
                customSectionHeader.lblSectionHeader.text = Constants.StringConstants.contactsSectionFirstHeaderTitle.rawValue
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

extension ListContactsVC: UITableViewDelegate {
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
        tableView.performBatchUpdates({
            let deletedRow = usersList.newlyAdded.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            usersList.recentlyDeleted.insert(deletedRow, at: 0)
            tableView.insertRows(at: [IndexPath(row: 0, section: 1)], with: .left)
        })
    }
    
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath) {
            tblContacts.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: User data delegate
extension ListContactsVC: UserDataDelegate {
    func userInfo(_ data: UserModel) {
        usersList.newlyAdded.append(data)
        usersList.newlyAdded.sort(by: { $0.fName ?? "" < $1.fName ?? "" } )
        tblContacts.reloadSections(IndexSet(integer: 0), with: .automatic)
    }
}
