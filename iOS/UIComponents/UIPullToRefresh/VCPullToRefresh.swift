//
//  VCPullToRefresh.swift
//  iOS
//
//  Created by Shubham Jitiya on 09/05/23.
//

import UIKit

class VCPullToRefresh: UIViewController {
    // MARK: Variables
    private var refreshController: UIRefreshControl!
    
    // MARK: IB outlets
    @IBOutlet private weak var tvRecords: UITableView!
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        pullToRefresh()
    }
}

// MARK: IB actions
extension VCPullToRefresh {
    @IBAction private func btnStartUpdate(_ sender: UIButton) {
        print(refreshController.isRefreshing)
        refreshController.beginRefreshing()
        refreshController.addTarget(self, action: #selector(updateTable), for: .valueChanged)
    }
    
    @IBAction private func btnEndUpdate(_ sender: UIButton) {
        refreshController.endRefreshing()
    }
}

// MARK: Delegate data-source
extension VCPullToRefresh: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int { 1 }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath) -> UITableViewCell { UITableViewCell() }
}

// MARK: Delegate table view
extension VCPullToRefresh: UITableViewDelegate {
    
}

// MARK: Functions
extension VCPullToRefresh {
    private func pullToRefresh() {
        refreshController = UIRefreshControl()
        refreshController.tintColor = .darkGray
        refreshController.attributedTitle = NSAttributedString(string: "Updating table")
        tvRecords.alwaysBounceVertical = true
        tvRecords.bounces = true
        refreshController.addTarget(self, action: #selector(updateTable), for: .valueChanged)
        tvRecords.refreshControl = refreshController
    }
    
    @objc private func updateTable() {
        print("New records added")
        refreshController.endRefreshing()
    }
}
