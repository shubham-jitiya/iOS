//
//  RecommendationCell.swift
//  iOS
//
//  Created by Shubham Jitiya on 04/05/23.
//

import UIKit

class RecommendationTableViewCell: UITableViewCell {
    // MARK: Variables
    private var recommendedMovies: [Movie] = []
    weak var selectedDataDelegate: SelectedItemDelegate?
    
    // MARK: IB outlets
    @IBOutlet weak var cvRecommendation: UICollectionView!
    @IBOutlet weak var pcRecommendation: UIPageControl!
    
    // MARK: Lifecycle methods
    override func awakeFromNib() {
        super.awakeFromNib()
        initialSetup()
    }
}

// MARK: Functions
extension RecommendationTableViewCell {
    private func initialSetup() {
        cvRecommendation.isPagingEnabled = true
        cvRecommendation.registerCell(type: RecommendationCollectionViewCell.self)
        configureFlowLayout()
        loadJson()
    }
    
    private func configureFlowLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(
            width: cvRecommendation.frame.size.width,
            height: 520)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 10
        cvRecommendation.collectionViewLayout = layout
    }
    
    func loadJson() {
        let decoder = JSONDecoder()
        do {
            let movies = try decoder.decode([Movie].self, from: jsonData)
            for movie in movies {
                recommendedMovies.append(movie)
            }
            print(movies[0])
        } catch {
            print(error.localizedDescription)
        }
    }
}

// MARK: Table view data-source
extension RecommendationTableViewCell: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
            recommendedMovies.count
        }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let recommendationCell = collectionView.dequeueCell(
                withType: RecommendationCollectionViewCell.self, for: indexPath)
                    as? RecommendationCollectionViewCell else {
                return UICollectionViewCell()
            }
            recommendationCell.config(data: recommendedMovies[indexPath.row])
            return recommendationCell
        }
}

// MARK: Table view delegate methods
extension RecommendationTableViewCell: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentPage = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        pcRecommendation.numberOfPages = recommendedMovies.count
        pcRecommendation.currentPage = currentPage
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath) {
            selectedDataDelegate?.selectedItem(at: recommendedMovies[indexPath.row])
        }
}

// MARK: Delegate flowlayout
extension RecommendationTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(
                width: cvRecommendation.frame.size.width,
                height: cvRecommendation.frame.size.height
            )
        }
}
