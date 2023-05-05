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

class RecommendationCell: UITableViewCell {
    // MARK: Variables
    static let identifier = "RecommendationCell"
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
extension RecommendationCell: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
            recommendedMovies.count
        }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let recommendationCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CVRecommendationCell.identifier,
                for: indexPath) as? CVRecommendationCell else {
                return UICollectionViewCell()
            }
            print("tag: ", cvRecommendation.tag)
            // let section = cvRecommendation.tag
            recommendationCell.frame.size.width = cvRecommendation.frame.size.width
            let imageUrl = recommendedMovies[indexPath.row].poster ?? ""
            recommendationCell.imgView.kf.setImage(with: URL(string: imageUrl))
            //recommendationCell.imgView.image = UIImage(named: "HeaderImage-1")
            return recommendationCell
        }
}

// MARK: Delegate methods
extension RecommendationCell: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentPage = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        pcRecommendation.numberOfPages = recommendedMovies.count
        pcRecommendation.currentPage = currentPage
        scrollView.showsHorizontalScrollIndicator = false
    }
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath) {
            // pass data to home screen to set selected image to top right corner
            selectedDataDelegate?.selectedItem(at: recommendedMovies[indexPath.row])
            print(indexPath)
        }
}

// MARK: Delegate flowlayout
extension RecommendationCell: UICollectionViewDelegateFlowLayout {
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
extension RecommendationCell {
    private func initialSetup() {
        cvRecommendation.isPagingEnabled = true
        cvRecommendation.register(
            CVRecommendationCell.nib(),
            forCellWithReuseIdentifier: CVRecommendationCell.identifier)
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
        //        layout.headerReferenceSize = CGSize(
        //            width: cvRecommendation.frame.size.width,
        //            height: 0)
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
