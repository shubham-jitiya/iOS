//
//  VCCollectionView.swift
//  iOS
//
//  Created by Shubham Jitiya on 03/05/23.
//

import UIKit

class CollectionViewVC: UIViewController {
    // MARK: Variables
    private var gridData: [String] = []
    private var refreshData: UIRefreshControl!
    
    // MARK: IB outlets
    @IBOutlet weak var gridCollectionView: UICollectionView!
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
}

// MARK: Functions
extension CollectionViewVC {
    private func initialSetup() {
        gridData = Helper.getGridData()
        pullToRefreshData()
    }
    
    private func pullToRefreshData() {
        self.refreshData = UIRefreshControl()
        refreshData.tintColor = .white
        refreshData.addTarget(self, action: #selector(loadData), for: .valueChanged)
        gridCollectionView.refreshControl = refreshData
        gridCollectionView.alwaysBounceVertical = true
        gridCollectionView.bounces = true
    }
    
    @objc private func loadData() {
        print("Loaded data")
        refreshData.endRefreshing()
    }
}

// MARK: Data-source
extension CollectionViewVC: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
            return gridData.count
        }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueCell(withType: DemoCollectionViewCell.self, for: indexPath) as? DemoCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configure(data: gridData[indexPath.row])
            return cell
        }
}

// MARK: Delegate methods
extension CollectionViewVC: UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath) {
            print(indexPath)
            guard let vcProductDetails = ProductDetailsVC
                .create(storyboardName: .uiProductDetails) as?
                    ProductDetailsVC else {
                return
            }
            navigate(to: vcProductDetails)
        }
}

// MARK: Delegate flow-layout
extension CollectionViewVC: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: collectionView.bounds.width / 2, height: 40)
        }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 8
        }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 10
        }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 4, left: 4, bottom: 0, right: 4)
        }
}
