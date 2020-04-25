//
//  SportsViewController.swift
//  SportyApp
//
//  Created by Ghadeer El-Mahdy on 4/19/20.
//  Copyright © 2020 mad40. All rights reserved.
//

import UIKit

class SportsViewController: UIViewController , ReachabilityObserverDelegate{
  
    
//outlets
    
    @IBOutlet weak var sportsView: UIView!
    @IBOutlet weak var internetView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
   
    //Actions
    
    @IBAction func retryInternet(_ sender: Any) {
           try? addReachabilityObserver()
        
    }
    private let collectionViewProvider = CollectionViewProvider()
    private let presenter = SportsPresenter.getInstance
    private var cellSizes = [[CGSize]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         try? addReachabilityObserver()
        
      
    }

    // MARK:- Collection View
    private func setupCollectionView() {
        collectionView.dataSource = collectionViewProvider
        collectionView.delegate = collectionViewProvider
        let indicator  = getIndicatorActivity()
        indicator.startAnimating()
        self.view.addSubview(indicator)
        presenter.getSports { (firstSectionItems) in
            self.collectionViewProvider.navigation = self.navigationController!
            self.collectionViewProvider.items = firstSectionItems
            indicator.stopAnimating()
            self.collectionView.reloadData()
        }
        showLayout()
       }
    

     private func showLayout() {
        // collectionView.collectionViewLayout = layout
         collectionView.setContentOffset(CGPoint.zero, animated: false)
         collectionView.reloadData()
     }
    
    
    func reachabilityChanged(_ isReachable: Bool) {
            if !isReachable {
               // print("No internet connection")
                internetView.isHidden = false
                sportsView.isHidden = true
                 //  try? addReachabilityObserver()
            }else {
              // print(" internet connection")
                internetView.isHidden = true
                sportsView.isHidden = false
                 setupCollectionView()
            }
    }
    deinit {
        removeReachabilityObserver()
    }
}
extension UIViewController {
    func getIndicatorActivity () -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView(style: .large)
               indicator.color = .darkGray
               indicator.hidesWhenStopped = true
               indicator.center = view.center
        return indicator
    }
}
