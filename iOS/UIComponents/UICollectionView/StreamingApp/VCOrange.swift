//
//  VCOrange.swift
//  iOS
//
//  Created by Shubham Jitiya on 04/05/23.
//

import UIKit

class VCOrange: UIViewController {

    // MARK: IB outlets
    @IBOutlet weak var tvHomeScreen: UITableView!
    
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
    
    func tableView(_ tableView: UITableView,
    numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let recommendationCell = tableView.dequeueReusableCell(
            withIdentifier: RecommendationCell.identifier) as? RecommendationCell else {
            return UITableViewCell()
        }
            
        recommendationCell.cvRecommendation.tag = indexPath.section
        return recommendationCell
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
        heightForRowAt indexPath: IndexPath) -> CGFloat { 200 }
    
}

// MARK: Functions
extension VCOrange {
    private func initialSetup() {
        tvHomeScreen.delegate = self
        tvHomeScreen.dataSource = self
        tvHomeScreen.isScrollEnabled = false
        initialiseNavigationController()
        registerCells()
    }
    
    private func initialiseNavigationController() {
        let imageBar = UIBarButtonItem(
            image: UIImage(systemName: Constants.Images.PERSON_FILLED.rawValue),
            style: .plain   ,
            target: self, action: #selector(imageBarTapped))
        navigationItem.rightBarButtonItem = imageBar
    }
    
    @objc private func imageBarTapped() {
           print("Image bar tapped")
    }
    
    private func registerCells() {
        tvHomeScreen.register(
            RecommendationCell.getNib(),
            forCellReuseIdentifier: RecommendationCell.identifier)
    }
}
