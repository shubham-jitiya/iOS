//
//  RecommendationCell.swift
//  iOS
//
//  Created by Shubham Jitiya on 04/05/23.
//

import UIKit

class RecommendationCell: UITableViewCell {
    // MARK: Variables
    static let identifier = "RecommendationCell"
    
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
            4
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
            recommendationCell.frame.size.width = cvRecommendation.frame.size.width
            recommendationCell.imgView.image = UIImage(named: "HeaderImage-1")
            return recommendationCell
        }
    
}

// MARK: Delegate methods
extension RecommendationCell: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentPage = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        pcRecommendation.currentPage = currentPage
        scrollView.showsHorizontalScrollIndicator = false
    }
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath) {
            print(indexPath)
        }
}

// MARK: Delegate flowlayout
extension RecommendationCell: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath) -> CGSize {
            if cvRecommendation.tag == 1 || cvRecommendation.tag == 2 {
                
                return CGSize(
                    width: cvRecommendation.frame.size.width / 2,
                    height: 520
                )
            }
            return CGSize(
                width: cvRecommendation.frame.size.width,
                height: 520
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
        //        layout.headerReferenceSize = CGSize(
        //            width: cvRecommendation.frame.size.width,
        //            height: 0)
        cvRecommendation.collectionViewLayout = layout
    }
}
