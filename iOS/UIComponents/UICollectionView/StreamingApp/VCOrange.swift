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

// MARK: Data-source
extension VCOrange: UITableViewDataSource {
    func numberOfSections(
        in tableView: UITableView
    ) -> Int { 2 }
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int { 1 }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let tvShowsCell = tableView.dequeueReusableCell(
                withIdentifier: ContentTableViewCell.identifier
            ) as? ContentTableViewCell else {
                return UITableViewCell()
            }
            guard let popularMoviesCell = tableView.dequeueReusableCell(
                withIdentifier: ContentTableViewCell.identifier
            ) as? ContentTableViewCell else {
                return UITableViewCell()
            }
            //recommendationCell.cvRecommendation.tag = indexPath.section
            switch indexPath.section {
            case 0:
                tvShowsCell.selectedContentDelegate = self
                tvShowsCell.lblContentTitle.text = "Watch next TV & Movies"
                return tvShowsCell
            case 1:
                popularMoviesCell.selectedContentDelegate = self
                popularMoviesCell.lblContentTitle.text = "Telugu Movies"
                return popularMoviesCell
            default:
                return UITableViewCell()
            }
        }
}

// MARK: Delegates
extension VCOrange: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath) {
            tvHomeScreen.deselectRow(at: indexPath, animated: true)
            print("Section: ", indexPath.section)
        }
    
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath) -> CGFloat { 250 }
}

// MARK: Functions
extension VCOrange {
    private func initialSetup() {
        tvHomeScreen.delegate = self
        tvHomeScreen.dataSource = self
        registerCells()
        initialiseHeader()
    }
    
    private func registerCells() {
        tvHomeScreen.register(
            RecommendationTableViewCell.getNib(),
            forCellReuseIdentifier: RecommendationTableViewCell.identifier)
        tvHomeScreen.register(
            ContentTableViewCell.getNib(),
            forCellReuseIdentifier: ContentTableViewCell.identifier)
        tvHomeScreen.register(
            ContentCollectionViewCell.getNib(),
            forCellReuseIdentifier: ContentCollectionViewCell.identifier)
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

extension VCOrange: SelectedDataDelegate {
    func selectedItem(at item: Movie) {
        setImageInNavigation(item)
        print("Data:", item.title)
    }
}

extension VCOrange: SelectedContentDelegate {
    
}

