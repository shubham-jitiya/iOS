//
//  TvShowsTableViewCell.swift
//  iOS
//
//  Created by Shubham Jitiya on 05/05/23.
//

import UIKit
import Kingfisher

class ContentTableViewCell: UITableViewCell {
    // MARK: Variables
    private var availableContents: [Movie] = []
    weak var delegate: SelectedItemDelegate?
    
    // MARK: IB outlets
    @IBOutlet weak var lblContentTitle: UILabel!
    @IBOutlet weak var cvTvShows: UICollectionView!
    
    // MARK: Lifecycle methods
    override func awakeFromNib() {
        super.awakeFromNib()
        initialSetup()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// MARK: Functions
extension ContentTableViewCell {
    private func initialSetup() {
        cvTvShows.delegate = self
        cvTvShows.dataSource = self
        cvTvShows.backgroundColor = .black
        availableContents = Movie.loadJson()
        registerCells()
    }
    
    private func registerCells() {
        cvTvShows.registerCell(type: ContentCollectionViewCell.self)
    }
    
    func configCategory(name: String) {
        lblContentTitle.text = name
    }
}

// MARK: Table view data-source
extension ContentTableViewCell: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
            return availableContents.count
        }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let tvShows = collectionView
                .dequeueCell(withType: ContentCollectionViewCell.self, for: indexPath)
                    as? ContentCollectionViewCell else {
                return UICollectionViewCell()
            }
            tvShows.config(data: availableContents[indexPath.row])
            return tvShows
        }
}

// MARK: Table view delegate methods
extension ContentTableViewCell: UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath) {
            delegate?.selectedItem(at: availableContents[indexPath.row])
        }
}
