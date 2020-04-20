//
//  SportsViewController.swift
//  SportyApp
//
//  Created by Ghadeer El-Mahdy on 4/19/20.
//  Copyright © 2020 mad40. All rights reserved.
//

import UIKit

class SportsViewController: UIViewController {
  
    
//outlets
    
    @IBOutlet weak var sportsView: UIView!
    @IBOutlet weak var internetView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let collectionViewProvider = CollectionViewProvider()
    private let presenter = SportsPresenter.getInstance
    private var cellSizes = [[CGSize]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setupCollectionView()
    }
    
    // MARK:- Collection View
    private func setupCollectionView() {
        collectionView.dataSource = collectionViewProvider
        collectionView.delegate = collectionViewProvider
        presenter.getSports { (firstSectionItems) in
            self.collectionViewProvider.navigation = self.navigationController!
            self.collectionViewProvider.items = firstSectionItems
            self.collectionView.reloadData()
        }
        showLayout()
       }
    

     private func showLayout() {
        // collectionView.collectionViewLayout = layout
         collectionView.setContentOffset(CGPoint.zero, animated: false)
         collectionView.reloadData()
     }

}
