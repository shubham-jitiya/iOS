//
//  TvShowsTableViewCell.swift
//  iOS
//
//  Created by Shubham Jitiya on 05/05/23.
//

import UIKit
import Kingfisher


protocol SelectedContentDelegate: AnyObject {
    func selectedItem(at item: Movie)
}

class ContentTableViewCell: UITableViewCell {
    // MARK: Variables
    static let identifier = "ContentTableViewCell"
    private var availableContents: [Movie] = []
    weak var selectedContentDelegate: SelectedContentDelegate?
    
    // MARK: IB outlets
    @IBOutlet weak var lblContentTitle: UILabel!
    @IBOutlet weak var cvTvShows: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initialSetup()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// MARK: Data-source
extension ContentTableViewCell: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
            return availableContents.count
        }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let tvShows = collectionView.dequeueReusableCell(
                withReuseIdentifier: ContentCollectionViewCell.identifier,
                for: indexPath) as? ContentCollectionViewCell else {
                return UICollectionViewCell()
            }
            let selectedContent = availableContents[indexPath.row]
            tvShows.config(data: selectedContent)
            return tvShows
        }
}

// MARK: Delegate methods
extension ContentTableViewCell: UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath) {
        selectedContentDelegate?.selectedItem(at: availableContents[indexPath.row])
    }
}

// MARK: Functions
extension ContentTableViewCell {
    private func initialSetup() {
        cvTvShows.delegate = self
        cvTvShows.dataSource = self
        loadJson()
    }
    
    static func nib() -> UINib {
        UINib(nibName: identifier, bundle: nil)
    }
    
    func loadJson() {
        let decoder = JSONDecoder()
        do {
            let contents = try decoder.decode([Movie].self, from: jsonData)
            for content in contents {
                availableContents.append(content)
            }
            print(contents[0])
        } catch {
            print(error.localizedDescription)
        }
    }
}
