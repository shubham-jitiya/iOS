//
//  RecommendationCell.swift
//  iOS
//
//  Created by Shubham Jitiya on 04/05/23.
//

import UIKit

protocol SelectedDataDelegate: AnyObject {
    func selectedItem(at item: Movie)
}

class RecommendationTableViewCell: UITableViewCell {
    // MARK: Variables
    static let identifier = "RecommendationTableViewCell"
    private var recommendedMovies: [Movie] = []
    weak var selectedDataDelegate: SelectedDataDelegate?
    
    // MARK: IB outlets
    @IBOutlet weak var cvRecommendation: UICollectionView!
    @IBOutlet weak var pcRecommendation: UIPageControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initialSetup()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// MARK: Data-source
extension RecommendationTableViewCell: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
            recommendedMovies.count
        }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let recommendationCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: RecommendationCollectionViewCell.identifier,
                for: indexPath) as? RecommendationCollectionViewCell else {
                return UICollectionViewCell()
            }
            print("tag: ", cvRecommendation.tag)
            // let section = cvRecommendation.tag
            recommendationCell.frame.size.width = cvRecommendation.frame.size.width
            let imageUrl = recommendedMovies[indexPath.row].poster ?? ""
            recommendationCell.imgView.kf.setImage(with: URL(string: imageUrl))
            return recommendationCell
        }
}

// MARK: Delegate methods
extension RecommendationTableViewCell: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentPage = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        pcRecommendation.numberOfPages = recommendedMovies.count
        pcRecommendation.currentPage = currentPage
        scrollView.showsHorizontalScrollIndicator = false
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

// MARK: Functions
extension RecommendationTableViewCell {
    private func initialSetup() {
        cvRecommendation.isPagingEnabled = true
        cvRecommendation.register(
            RecommendationCollectionViewCell.nib(),
            forCellWithReuseIdentifier: RecommendationCollectionViewCell.identifier)
        configureFlowLayout()
        loadJson()
    }
    
    static func getNib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
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
