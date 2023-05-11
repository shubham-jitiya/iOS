//
//  VCSearch.swift
//  iOS
//
//  Created by Shubham Jitiya on 11/05/23.
//

import UIKit

class VCSearch: UIViewController {
    
    // MARK: View lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

// MARK: IB Actions
extension VCSearch {
    @IBAction private func btnSearch() {
        guard let vcSearchBar = VCSearchBar.create(storyboardName: .uiSearchBar) as? VCSearchBar else {
            return
        }
        navigate(to: vcSearchBar)
    }
}

