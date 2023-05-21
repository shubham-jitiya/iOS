//
//  VCOrange.swift
//  iOS
//
//  Created by Shubham Jitiya on 04/05/23.
//

import UIKit
import Kingfisher

class OrangeVC: UIViewController {
    
    // MARK: IB outlets
    @IBOutlet weak var tvHomeScreen: UITableView!
    @IBOutlet weak var imgViewPoster: UIImageView!
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
}

// MARK: IB actions
extension OrangeVC {
    @IBAction private func btnBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: Functions
extension OrangeVC {
    private func initialSetup() {
        tvHomeScreen.delegate = self
        tvHomeScreen.dataSource = self
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        registerCells()
        setupTableHeader()
    }
    
    private func registerCells() {
        tvHomeScreen.registerCell(type: RecommendationTableViewCell.self)
        tvHomeScreen.registerCell(type: ContentTableViewCell.self)
    }
    
    private func setupTableHeader() {
        guard let header = tvHomeScreen.dequeueCell(withType: RecommendationTableViewCell.self) as? RecommendationTableViewCell else {
            return
        }
        header.delegate = self
        tvHomeScreen.tableHeaderView = header
    }
    
    private func setImageInNavigation(_ item: Movie) {
        let url = URL(string: item.poster ?? "")
        imgViewPoster.kf.setImage(with: url)
        imgViewPoster.layer.cornerRadius = imgViewPoster.frame.size.width / 2.0
    }
}

// MARK: Table view data-source
extension OrangeVC: UITableViewDataSource {
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
                tvShowsCell.delegate = self
                tvShowsCell.configCategory(name: Constants.StringConstants.orangeCategoryTvMovies.rawValue)
                return tvShowsCell
            case 1:
                guard let popularMoviesCell = tableView.dequeueCell(withType: ContentTableViewCell.self)
                        as? ContentTableViewCell else {
                    return UITableViewCell()
                }
                popularMoviesCell.delegate = self
                popularMoviesCell.configCategory(name: Constants.StringConstants.orangeCategoryTeluguMovies.rawValue)
                return popularMoviesCell
            default:
                return UITableViewCell()
            }
        }
}

// MARK: Table view delegate
extension OrangeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tvHomeScreen.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
}
// MARK: SelectedItem delegate
extension OrangeVC: SelectedItemDelegate {
    func selectedItem(at item: Movie) {
        setImageInNavigation(item)
    }
}
