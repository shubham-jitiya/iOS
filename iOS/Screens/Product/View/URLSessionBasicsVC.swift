//
//  URLSessionBasicsVC.swift
//  iOS
//
//  Created by Shubham Jitiya on 03/07/23.
//

import UIKit
import RswiftResources

class URLSessionBasicsVC: UIViewController {
    // MARK: - Vars & lets
    private var viewModel = ProductsViewModel()
    
    // MARK: - Outlets
    @IBOutlet private weak var tableViewProducts: UITableView!
    @IBOutlet private weak var searchProducts: UISearchBar!
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        searchProducts.delegate = self
    }
}

// MARK: - IBActions
extension URLSessionBasicsVC {
    @IBAction private func downloadFile(sender: UIButton) {
        viewModel.downloadImage()
    }
}

// MARK: - Extensions
// MARK: Configure API
extension URLSessionBasicsVC {
    private func initialSetup() {
        tableViewProducts.register(R.nib.productsTableViewCell)
        viewModel.shopFiltered.bind { [weak self] _ in
            guard let self else { return }
            DispatchQueue.main.async {
                self.tableViewProducts.reloadData()
            }
        }
    }
}

// MARK: - Table view Datasource
extension URLSessionBasicsVC: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return viewModel.shopFiltered.value.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let listItem = tableView.dequeueReusableCell(
            withIdentifier: R.reuseIdentifier.productsTableViewCell,
            for: indexPath) else {
            return UITableViewCell()
        }
        listItem.config(data: viewModel.shopFiltered.value[indexPath.row])
        return listItem
    }
}

// MARK: - Table view Delegate
extension URLSessionBasicsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


// MARK: - Search Delegate
extension URLSessionBasicsVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.filterProducts(query: searchBar.text ?? "")
    }
}
