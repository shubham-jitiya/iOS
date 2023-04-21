//
//  TVAutoResizingVC.swift
//  iOS
//
//  Created by Shubham on 04/06/23.
//

import UIKit

class TVAutoResizingVC: UIViewController {
    // MARK: Variables
    private var data = 0
    
    // MARK: IB outlets
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var tableViewHeight: NSLayoutConstraint!
    @IBOutlet private weak var stack: UIStackView!
    
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        setupMaxTableHeight()
    }
}

// MARK: Functions
extension TVAutoResizingVC {
    private func initialSetup() {
        tableView.register(IndexTableViewCell.getNib(), forCellReuseIdentifier: IndexTableViewCell.reuseIdentifier)
        setupNavigationBarItems()
    }
    
    private func setupNavigationBarItems() {
        let barItemAdd = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(btnAddCellTapped))
        navigationItem.rightBarButtonItem = barItemAdd
    }
    
    @objc private func btnAddCellTapped() {
        data += 1
        tableView.reloadData()
        setupMaxTableHeight()
        tableView.scrollToRow(at: IndexPath(row: data - 1 , section: 0), at: .bottom, animated: true)
    }
    
    private func setupMaxTableHeight() {
        if data == 0 {
            stack.isHidden = true
        } else if data < 6 {
            stack.isHidden = false
            let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
            let cellHeight = cell?.frame.height ?? 0
            tableViewHeight.constant = CGFloat(data) * cellHeight
        }
    }
}

// MARK: Data source - Table view
extension TVAutoResizingVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: IndexTableViewCell.reuseIdentifier, for: indexPath) as? IndexTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data
    }
}
