//
//  VCBasicCollectionView.swift
//  iOS
//
//  Created by Shubham Jitiya on 04/05/23.
//

import UIKit

class BasicCollectionViewVC: UIViewController {
    
    // MARK: IB outlets
    @IBOutlet private weak var cvHeader: UICollectionView!
    @IBOutlet private weak var headerPageController: UIPageControl!
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
}

// MARK: Functions
extension BasicCollectionViewVC {
    private func initialSetup() {
        cvHeader.delegate = self
        cvHeader.dataSource = self
        cvHeader.isPagingEnabled = true
        registerCells()
        configureFlowLayout()
    }
    
    private func registerCells() {
        cvHeader.registerCell(type: HeaderCollectionViewCell.self)
        cvHeader.register(
            HeaderSectionTitle.nib(),
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: HeaderSectionTitle.identifier)
    }
    
    private func configureFlowLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(
            width: view.bounds.width,
            height: cvHeader.frame.size.height)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.headerReferenceSize = CGSize(
            width: cvHeader.frame.size.width,
            height: 0)
        cvHeader.collectionViewLayout = layout
    }
}

// MARK: Delegate methods
extension BasicCollectionViewVC: UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath) {
            collectionView.deselectItem(at: indexPath, animated: true)
            print("You tapped me")
        }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentPage = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        headerPageController.currentPage = currentPage
        scrollView.showsHorizontalScrollIndicator = false
    }
}

// MARK: Data-source
extension BasicCollectionViewVC: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
            return 12
        }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let itemHeaderCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: HeaderCollectionViewCell.identifier,
                for: indexPath) as? HeaderCollectionViewCell else {
                return UICollectionViewCell()
            }
            itemHeaderCell.imgView.image = UIImage(named: Constants.Images.placeHolderLandscape.rawValue)
            return itemHeaderCell
        }
    
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath) -> UICollectionReusableView {
            if kind == UICollectionView.elementKindSectionHeader {
                guard let headerSectionView = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: HeaderSectionTitle.identifier,
                    for: indexPath) as? HeaderSectionTitle else {
                    return UICollectionReusableView()
                }
                headerSectionView.backgroundColor = .lightText
                headerSectionView.lblSectionTitle.textColor = .black
                headerSectionView.lblSectionTitle.text = Constants.StringConstants.collectionViewBasicElementaryTitle.rawValue
                return headerSectionView
            }
            return UICollectionViewCell()
        }
}

// MARK: Flow layout
extension BasicCollectionViewVC: UICollectionViewDelegateFlowLayout {
    
}
