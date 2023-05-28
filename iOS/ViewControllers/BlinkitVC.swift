//
//  blinkitVC.swift
//  iOS
//
//  Created by Shubham on 28/05/23.
//

import UIKit

class BlinkitVC: UIViewController {
    
    // MARK: IB outlets
    @IBOutlet private weak var tableViewGrocerySection: UITableView!
    @IBOutlet private weak var collectionViewGroceryItems: UICollectionView!
    
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        setupFlowLayout()
    }
}

// MARK: Functions
extension BlinkitVC {
    private func initialSetup() {
        collectionViewGroceryItems.delegate = self
        collectionViewGroceryItems.dataSource = self
        
        collectionViewGroceryItems.registerCell(type: GroceryItemCollectionViewCell.self)
    }
    
    private func setupFlowLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (collectionViewGroceryItems.frame.width - 30)/2, height: 200)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 5
        collectionViewGroceryItems.setCollectionViewLayout(layout, animated: true)
    }
}

// MARK: Datasource - CollectioView
extension BlinkitVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        25
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueCell(withType: GroceryItemCollectionViewCell.self, for: indexPath) as? GroceryItemCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
}

// MARK: Delegate - CollectionView
extension BlinkitVC: UICollectionViewDelegate {
    
}

// MARK: Flowlayout
extension BlinkitVC: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 4, left: 4, bottom: 0, right: 4)
        }
}
