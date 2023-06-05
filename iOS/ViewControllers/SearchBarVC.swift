//
//  VCSearchBar.swift
//  iOS
//
//  Created by Shubham Jitiya on 10/05/23.
//

import UIKit

class SearchBarVC: UIViewController {
    // MARK: Variables
    private var data: [String] = []
    private var filteredData: [String] = []
    private var scopeBarItems: [String] = []
    private var searchController: UISearchController!
    
    // MARK: IB outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
}

// MARK: Functions
extension SearchBarVC {
    private func initialSetup() {
        tableView.dataSource = self
        searchBar.delegate = self
        data = Helper.getCities()
        scopeBarItems = ["NY", "TX"]
        searchBar.showsScopeBar = true
        searchBar.scopeButtonTitles = scopeBarItems
        searchBar.placeholder = "Start typing"
    }
}

// MARK: Table view data source
extension SearchBarVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = filteredData[indexPath.row]
        return cell
    }
}

// MARK: Search delegate methods
extension SearchBarVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = searchText.isEmpty ? data : data.filter {
            (item: String) -> Bool in
            return item.range(
                of: searchText,
                options: .caseInsensitive,
                range: nil,
                locale: nil) != nil
        }
        tableView.reloadData()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
    
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        print("Bookmarked")
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.showsCancelButton = false
        print("Search button clicked")
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        switch selectedScope {
        case 0:
            filteredData = ["New York, NY"]
            tableView.reloadData()
        case 1:
            filteredData = ["Houston, TX", "San Antonio, TX", "Dallas, TX", "Austin, TX", "Fort Worth, TX"]
            tableView.reloadData()
        default:
            filteredData = []
        }
        print(scopeBarItems[selectedScope])
    }
}
