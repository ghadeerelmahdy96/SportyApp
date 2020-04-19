//
//  CollectionViewProvider.swift
//  SportyApp
//
//  Created by Ghadeer El-Mahdy on 4/19/20.
//  Copyright © 2020 mad40. All rights reserved.
//

import UIKit

class CollectionViewProvider: NSObject,UICollectionViewDataSource {
    
        var items = [[String]]()
        var supplementaryItems = [String]()

        // MARK: - UICollectionViewDataSource

        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return supplementaryItems.count
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return items[section].count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContentCellIdentifier", for: indexPath)

            if let cell = cell as? ContentCollectionViewCell {
                let item = items[indexPath.section][indexPath.row]
                cell.populate(with: item, andImage: "https://www.bigstockphoto.com/images/homepage/module-6.jpg")
            }
            
            return cell
        }

        func collectionView(_ collectionView: UICollectionView,
                            viewForSupplementaryElementOfKind kind: String,
                            at indexPath: IndexPath) -> UICollectionReusableView {

           // if kind == UICollectionView.elementKindSectionHeader {
                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                                 withReuseIdentifier: "HeaderViewIdentifier",
                                                                                 for: indexPath)

                if let headerView = headerView as? HeaderCollectionReusableView {
                    let item = supplementaryItems[indexPath.section]
                    headerView.populate(with: item)
                }

                return headerView
         //   }
        }

}
