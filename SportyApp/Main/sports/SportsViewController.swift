//
//  SportsViewController.swift
//  SportyApp
//
//  Created by Ghadeer El-Mahdy on 4/19/20.
//  Copyright © 2020 mad40. All rights reserved.
//

import UIKit
import collection_view_layouts
enum LayoutType: Int {
    case flickr
}
class SportsViewController: UIViewController , ContentDynamicLayoutDelegate{
  
    
//outlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    private let collectionViewProvider = CollectionViewProvider()

    private var cellSizes = [[CGSize]]()
    private var layout: ContentDynamicLayout!
    override func viewDidLoad() {
        super.viewDidLoad()
       setupCollectionView()
        prepareCellSizes(withType: .flickr)
               showLayout(withType: .flickr)
    }
    
    // MARK:- Collection View
    private func setupCollectionView() {
           collectionView.dataSource = collectionViewProvider

           let firstSectionItems = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten",
                                    "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen",
                                    "eighteen", "nineteen", "twenty"]

           let secondSectionItems = ["activity", "appstore", "calculator", "camera", "contacts", "clock", "facetime",
                                    "health", "mail", "messages", "music", "notes", "phone", "photos", "podcasts",
                                    "reminders", "safari", "settings", "shortcuts", "testflight", "wallet", "watch",
                                    "weather"]
           collectionViewProvider.items = [firstSectionItems, secondSectionItems]
           collectionViewProvider.supplementaryItems = ["numbers", "apps"]
       }
    
    
    private func prepareCellSizes(withType type: LayoutType) {
         //let range = 50...150
         cellSizes.removeAll()

         collectionViewProvider.items.forEach { items in
             let sizes = items.map { item -> CGSize in
                 switch type {
                 default:
                     return CGSize(width: 0.1, height: 0.1)
                 }
             }

             cellSizes.append(sizes)
         }
     }

     private func showLayout(withType type: LayoutType) {
         switch type {
         case .flickr:
             layout = FlickrStyleFlowLayout()
         }

         layout.delegate = self

         // All layouts support this configs
         layout.contentPadding = ItemsPadding(horizontal: 15, vertical: 15)
         layout.cellsPadding = ItemsPadding(horizontal: 10, vertical: 10)

         collectionView.collectionViewLayout = layout
         collectionView.setContentOffset(CGPoint.zero, animated: false)
         collectionView.reloadData()
     }
    
    // MARK:- ContentDynamicLayoutDelegate
    func cellSize(indexPath: IndexPath) -> CGSize {
           return cellSizes[indexPath.section][indexPath.row]
       }

    func headerHeight(indexPath: IndexPath) -> CGFloat {
           return 44
       }

}
