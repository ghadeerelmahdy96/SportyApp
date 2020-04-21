//
//  CollectionViewExtension.swift
//  SportyApp
//
//  Created by Yahya Ewida on 4/20/20.
//  Copyright © 2020 mad40. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension DetailsViewController : UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         if collectionView == upcomingCollectionView{
            return CGSize(width: 238, height: 209)
                      
          }else if collectionView == latestCollectionView{
               return CGSize(width: 269, height: 209)
          }else if collectionView == teamsCollectionView{
               return CGSize(width: 192, height: 152)
          }
        return CGSize(width: 296, height: 209)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       if collectionView == upcomingCollectionView{
            return upcomingEventsArray.count
               
       }else if collectionView == latestCollectionView{
            return latestEventsArray.count
       }else if collectionView == teamsCollectionView{
            return teamsArray.count
       }
        return 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == upcomingCollectionView{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: upcomingCellName, for: indexPath) as! UpcomingCollectionViewCell
        
            configureUpComingEventsCell(cell : cell, index: indexPath.row)
            
            return cell
                   
           }else if collectionView == latestCollectionView{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: latestCellName, for: indexPath) as! LatestCollectionViewCell
          
            configureLatestEventsCell(cell : cell, index: indexPath.row)
            return cell
              
           }else if collectionView == teamsCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: teamCellName, for: indexPath) as! TeamCollectionViewCell
            
            configureTeamsCell(cell : cell, index: indexPath.row)
            
            return cell
           }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == teamsCollectionView{
            let storyboard = UIStoryboard(name: "Details", bundle: nil)
               let controller = storyboard.instantiateViewController(identifier: "teamDetailsView") as! TeamTableViewController
                    controller.teamFromLeagueDetails = teamsArray[indexPath.row]
                    controller.modalPresentationStyle = .fullScreen
                    self.present(controller, animated: true, completion: nil)
        }
    }
    
    
}
