//
//  VCOrange.swift
//  iOS
//
//  Created by Shubham Jitiya on 04/05/23.
//

import UIKit
import Kingfisher

class VCOrange: UIViewController {
    // MARK: IB outlets
    @IBOutlet weak var tvHomeScreen: UITableView!
    @IBOutlet weak var imgSelection: UIImageView!
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
}

// MARK: IB actions
extension VCOrange {
    @IBAction private func btnBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: Functions
extension VCOrange {
    private func initialSetup() {
        tvHomeScreen.delegate = self
        tvHomeScreen.dataSource = self
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        registerCells()
        initialiseHeader()
    }
    
    private func registerCells() {
        tvHomeScreen.registerCell(type: RecommendationTableViewCell.self)
        tvHomeScreen.registerCell(type: ContentTableViewCell.self)
    }
    
    private func setImageInNavigation(_ item: Movie) {
        let url = URL(string: item.poster ?? "")
        imgSelection.kf.setImage(with: url)
        imgSelection.layer.cornerRadius = imgSelection.frame.size.width / 2.0
    }
    
    private func initialiseHeader() {
        guard let header = tvHomeScreen.dequeueReusableCell(
            withIdentifier: RecommendationTableViewCell.identifier) as? RecommendationTableViewCell else {
            return
        }
        header.selectedDataDelegate = self
        tvHomeScreen.tableHeaderView = header
    }
}

// MARK: Table view data-source
extension VCOrange: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            return 1
        }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            switch indexPath.section {
            case 0:
                guard let tvShowsCell = tableView.dequeueCell(withType: ContentTableViewCell.self)
                        as? ContentTableViewCell else {
                    return UITableViewCell()
                }
                tvShowsCell.selectedContentDelegate = self
                tvShowsCell.configCategory(name: ConstantsOrange.Strings.category_1.rawValue)
                return tvShowsCell
            case 1:
                guard let popularMoviesCell = tableView.dequeueCell(withType: ContentTableViewCell.self)
                        as? ContentTableViewCell else {
                    return UITableViewCell()
                }
                popularMoviesCell.selectedContentDelegate = self
                popularMoviesCell.configCategory(name: ConstantsOrange.Strings.category_2.rawValue)
                return popularMoviesCell
            default:
                return UITableViewCell()
            }
        }
}

// MARK: Table view delegate methods
extension VCOrange: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tvHomeScreen.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
}

extension VCOrange: SelectedItemDelegate {
    func selectedItem(at item: Movie) {
        setImageInNavigation(item)
    }
}
