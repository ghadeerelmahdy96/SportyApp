//
//  CollectionViewProvider.swift
//  SportyApp
//
//  Created by Ghadeer El-Mahdy on 4/19/20.
//  Copyright © 2020 mad40. All rights reserved.
//

import UIKit

class CollectionViewProvider: NSObject,UICollectionViewDataSource , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout{
    
        var items = [Sport]()
        var navigation : UINavigationController = UINavigationController.init()

        // MARK: - UICollectionViewDataSource

        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            var count = 0
            if items.count != 0 {
                count = items.count
            }
            return count
        }
    
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContentCellIdentifier", for: indexPath)

            if let cell = cell as? ContentCollectionViewCell {
                let item = items[indexPath.row]
                cell.populate(with: item.strSport, andImage: item.strSportThumb)
            }
            
            return cell
        }

//        func collectionView(_ collectionView: UICollectionView,
//                            viewForSupplementaryElementOfKind kind: String,
//                            at indexPath: IndexPath) -> UICollectionReusableView {
//            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
//                                                                                 withReuseIdentifier: "HeaderViewIdentifier",
//                                                                                 for: indexPath)
//
//                if let headerView = headerView as? HeaderCollectionReusableView {
//                    headerView.populate(with: "Sports")
//                }
//
//                return headerView
//        }
  // MARK:- Uicollection view delegate
 func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let cell = collectionView.cellForItem(at: indexPath)
    if (cell as? ContentCollectionViewCell) != nil {
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(identifier: "leagueView") as! LeaguesTableViewController
            controller.sportTitle = items[indexPath.row].strSport
        controller.modalPresentationStyle = .fullScreen
        navigation.pushViewController(controller, animated: true)
    }
   }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        layout.minimumInteritemSpacing = 2
        let padding: CGFloat = 15
        let collectionCellSize = (collectionView.frame.size.width - padding)/2

         return CGSize(width: collectionCellSize, height: collectionCellSize)
       }
//
//    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
//       let cell = collectionView.cellForItem(at: indexPath)
//        if let cell = cell as? ContentCollectionViewCell {
//            cell.sportTitleLabel.isHidden = true
//        }
//
//    }
//    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//         let cell = collectionView.cellForItem(at: indexPath)
//               if let cell = cell as? ContentCollectionViewCell {
//                   cell.sportTitleLabel.isHidden = false
//               }
//    }
   

}
