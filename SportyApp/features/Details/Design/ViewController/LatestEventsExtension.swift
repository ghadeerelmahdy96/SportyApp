//
//  LatestEventsExtension.swift
//  SportyApp
//
//  Created by Yahya Ewida on 4/20/20.
//  Copyright © 2020 mad40. All rights reserved.
//

import Foundation
import UIKit

extension DetailsViewController{
    
    func getLatestEvents(leagueId : String){
          
      let closure = { (latestEventsArrayNew :[Event]) -> Void in
          DispatchQueue.main.async {
            self.latestEventsArray = latestEventsArrayNew
            
            self.latestCollectionView.isUserInteractionEnabled = true
            self.latestCollectionView.reloadData()
            self.activityIndicator.stopAnimating()
          }
      }
      detailsPresenter.getLatestEvents(byLeagueId: leagueId, completionHandler: closure)
    }
    
    func configureLatestEventsCell(cell : LatestCollectionViewCell , index : Int){
        
        if latestEventsArray[index].strAwayTeam != "null" && latestEventsArray[index].strAwayTeam != "" &&
            latestEventsArray[index].strHomeTeam != "null" && latestEventsArray[index].strHomeTeam != ""{
            
            cell.awayLabel.text = latestEventsArray[index].strAwayTeam
            cell.homeLabel.text = latestEventsArray[index].strHomeTeam
            cell.dateLabel.text = latestEventsArray[index].strDate
            cell.timeLabel.text = latestEventsArray[index].strTime
            if (latestEventsArray[index].intAwayScore == "null"){
                cell.awayScoreLabel.text  = "--"
            }
            else{
                cell.awayScoreLabel.text = latestEventsArray[index].intAwayScore
            }
            
            if (latestEventsArray[index].intHomeScore == "null"){
                cell.homeScoreLabel.text  = "--"
            }
            else{
                cell.homeScoreLabel.text = latestEventsArray[index].intHomeScore
            }
            if isTeamDataLoaded{
                let hometeamsList = teamsArray.filter({(value) in value.strTeam ==  latestEventsArray[index].strHomeTeam})
                 latestEventsArray[index].strHomeTeamLogo = hometeamsList[0].strTeamBadge
                 
                 cell.homeTeamImageView.kf.setImage(with: URL(string: hometeamsList[0].strTeamBadge),placeholder: UIImage(named: ""))
                 
                 let awayteamsList = teamsArray.filter({(value) in value.strTeam ==  latestEventsArray[index].strAwayTeam})
                
                latestEventsArray[index].strAwayTeamLogo = awayteamsList[0].strTeamBadge
                cell.awayTeamImageView.kf.setImage(with: URL(string:awayteamsList[0].strTeamBadge),placeholder: UIImage(named: ""))
            }
        }else{
            cell.isHidden = true            
        }
        
    }
}
