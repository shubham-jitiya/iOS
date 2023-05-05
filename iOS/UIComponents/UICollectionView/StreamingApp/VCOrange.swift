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
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int { 1 }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let recommendationCell = tvHomeScreen.dequeueReusableCell(
                withIdentifier: "RecommendationCell") as? RecommendationCell else {
                return UITableViewCell()
            }
            guard let tvShows = tableView.dequeueReusableCell(
                withIdentifier: TvShowsTableViewCell.identifier
            ) as? TvShowsTableViewCell else {
                return UITableViewCell()
            }
            //recommendationCell.cvRecommendation.tag = indexPath.section
            recommendationCell.selectedDataDelegate = self
            tvShows.selectedMoviesDelegate = self
            let section = indexPath.section
            switch section {
            case 0:
                //                tvHomeScreen.tableHeaderView = recommendationCell
                return recommendationCell
            case 1:
                tvShows.lblContentTitle.text = "Popular TV Shows"
                return tvShows
            case 2:
                tvShows.lblContentTitle.text = "Popular Movies"
                return tvShows
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
    
    //    func tableView(
    //        _ tableView: UITableView,
    //        viewForHeaderInSection section: Int) -> UIView? {
    //            guard let recommendationCell = tvHomeScreen.dequeueReusableHeaderFooterView(
    //                withIdentifier: "HeaderView") as? HeaderView else {
    //                return UITableViewCell()
    //            }
    //            // recommendationCell.cvRecommendation.tag = indexPath.section
    //            //recommendationCell.selectedDataDelegate = self
    //            // tvHomeScreen.tableHeaderView = recommendationCell
    //            return recommendationCell
    //        }
}

// MARK: Functions
extension VCOrange {
    private func initialSetup() {
        tvHomeScreen.delegate = self
        tvHomeScreen.dataSource = self
        // tvHomeScreen.isScrollEnabled = false
        initialiseTableHeader()
        registerCells()
    }
    
    private func registerCells() {
        tvHomeScreen.register(
            RecommendationCell.getNib(),
            forCellReuseIdentifier: RecommendationCell.identifier)
    }
    
    private func initialiseTableHeader() {
        //        viewTblHeader.frame =  CGRect(
        //            x: 0,
        //            y: 0,
        //            width: tblContents.frame.size.width,
        //            height: 50)
        //        guard let recommendationCell = tvHomeScreen.dequeueReusableCell(
        //            withIdentifier: "HeaderView") as? HeaderView else {
        //            return
        //        }
        //
        //        recommendationCell.frame = CGRect(
        //                        x: 0,
        //                        y: 0,
        //                        width: tvHomeScreen.frame.size.width,
        //                        height: 50)
        //        tvHomeScreen.tableHeaderView = recommendationCell
    }
}

extension VCOrange: SelectedDataDelegate {
    func selectedItem(at item: Movie) {
        // Create a circular image with Kingfisher
        let url = URL(string: item.poster ?? "")
        imgSelection.kf.setImage(with: url)
        imgSelection.layer.cornerRadius = imgSelection.frame.size.width / 2.0
        print("Data:", item.title)
    }
}

extension VCOrange: SelectedMovieDelegate {
    
}

