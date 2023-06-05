//
//  VCSearch.swift
//  iOS
//
//  Created by Shubham Jitiya on 11/05/23.
//

import UIKit

class SearchVC: UIViewController {
    
    // MARK: View lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: IB Actions
extension SearchVC {
    @IBAction private func btnSearch() {
        guard let vcSearchBar = SearchBarVC.create(storyboardName: .uiSearchBar) as? SearchBarVC else {
            return
        }
        navigate(to: vcSearchBar)
    }
}

