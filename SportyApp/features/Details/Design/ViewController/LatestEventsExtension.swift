//
//  LatestEventsExtension.swift
//  SportyApp
//
//  Created by Yahya Ewida on 4/20/20.
//  Copyright © 2020 mad40. All rights reserved.
//

import Foundation


extension DetailsViewController{
    
    func getLatestEvents(leagueId : String){
          
      let closure = { (latestEventsArrayNew :[Event]) -> Void in
          DispatchQueue.main.async {
              self.latestEventsArray = latestEventsArrayNew
              self.latestCollectionView.reloadData()
              self.activityIndicator.stopAnimating()
              self.latestCollectionView.isUserInteractionEnabled = true
          }
      }
      detailsPresenter.getLatestEvents(byLeagueId: leagueId, completionHandler: closure)
    }
    
    func configureLatestEventsCell(cell : LatestCollectionViewCell , index : Int){
        
        cell.awayLabel.text = latestEventsArray[index].strAwayTeam
        cell.homeLabel.text = latestEventsArray[index].strHomeTeam
        cell.dateLabel.text = latestEventsArray[index].strDate
        cell.timeLabel.text = latestEventsArray[index].strTime
        if (latestEventsArray[index].intAwayScore == "null"){
            cell.awayScoreLabel.text  = "Cancelled"
        }
        else{
            cell.awayScoreLabel.text = latestEventsArray[index].intAwayScore
        }
        
        if (latestEventsArray[index].intHomeScore == "null"){
            cell.homeScoreLabel.text  = "Cancelled"
        }
        else{
            cell.homeScoreLabel.text = latestEventsArray[index].intHomeScore
        }
        
    }
}
