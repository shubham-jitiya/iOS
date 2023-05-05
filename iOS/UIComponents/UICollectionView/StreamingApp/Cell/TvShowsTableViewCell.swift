//
//  TvShowsTableViewCell.swift
//  iOS
//
//  Created by Shubham Jitiya on 05/05/23.
//

import UIKit
import Kingfisher


protocol SelectedMovieDelegate: AnyObject {
    func selectedItem(at item: Movie)
}

class TvShowsTableViewCell: UITableViewCell {
    // MARK: Variables
    static let identifier = "TvShowsTableViewCell"
    private var trendingMovies: [Movie] = []
    weak var selectedMoviesDelegate: SelectedMovieDelegate?
    
    // MARK: IB outlets
    @IBOutlet weak var lblContentTitle: UILabel!
    @IBOutlet weak var cvTvShows: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initialSetup()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}

// MARK: Data-source
extension TvShowsTableViewCell: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
            return trendingMovies.count
        }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let tvShows = collectionView.dequeueReusableCell(
                withReuseIdentifier: "TvShowsCollectionViewCell",
                for: indexPath) as? TvShowsCollectionViewCell else {
                return UICollectionViewCell()
            }
            let imageUrl = trendingMovies[indexPath.row].poster ?? ""
            tvShows.imgViewTvShows.kf.setImage(with: URL(string: imageUrl))
            return tvShows
        }
}

// MARK: Delegate methods
extension TvShowsTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedMoviesDelegate?.selectedItem(at: trendingMovies[indexPath.row])
    }
}

// MARK: Functions
extension TvShowsTableViewCell {
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
            let movies = try decoder.decode([Movie].self, from: jsonData)
            for movie in movies {
                trendingMovies.append(movie)
            }
            print(movies[0])
        } catch {
            print(error.localizedDescription)
        }
    }
}
