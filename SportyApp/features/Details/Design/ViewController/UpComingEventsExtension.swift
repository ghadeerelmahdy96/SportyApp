//
//  UpComingExtension.swift
//  SportyApp
//
//  Created by Yahya Ewida on 4/20/20.
//  Copyright © 2020 mad40. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension DetailsViewController{
    
    func getUpComingEvents(leagueId : String){
           
       let closure = { (upComingEventsArrayNew :[Event]) -> Void in
           DispatchQueue.main.async {
            self.upcomingEventsArray = upComingEventsArrayNew.filter{ value in
                return value.strAwayTeam != "null" && value.strAwayTeam != "" && value.strHomeTeam != "null" && value.strHomeTeam != ""
            }
            self.activityIndicator.stopAnimating()
            self.renderUpcomingEvents()
              
           }
       }
       detailsPresenter.getUpcomingEvents(byLeagueId: leagueId, completionHandler: closure)
       
    }
    
    func configureUpComingEventsCell(cell : UpcomingCollectionViewCell , index : Int) {
  
        
         cell.awayTeamLabel.text = upcomingEventsArray[index].strAwayTeam
         cell.homeTeamLabel.text = upcomingEventsArray[index].strHomeTeam
         cell.dateLabel.text = upcomingEventsArray[index].strDate
         cell.timeLabel.text = upcomingEventsArray[index].strTime
         if isTeamDataLoaded{
             
            let hometeamsList = teamsArray.filter({(value) in value.strTeam ==  upcomingEventsArray[index].strHomeTeam})
            if hometeamsList.count>0{
                upcomingEventsArray[index].strHomeTeamLogo = hometeamsList[0].strTeamBadge
                               
                cell.homeImageView.kf.setImage(with: URL(string: hometeamsList[0].strTeamBadge))
            }

            let awayteamsList = teamsArray.filter({(value) in value.strTeam ==  upcomingEventsArray[index].strAwayTeam})
            if awayteamsList.count>0 {
                upcomingEventsArray[index].strAwayTeamLogo = awayteamsList[0].strTeamBadge
                cell.awayImageView.kf.setImage(with: URL(string:awayteamsList[0].strTeamBadge))
            }
            
         }
         
        cell.vsLabel.text = "VS"
        cell.layer.cornerRadius = 15
        cell.layer.borderWidth = 1
        
    }
    func renderUpcomingEvents(){
        if self.upcomingEventsArray.count>0{
            self.upcomingCollectionView.isUserInteractionEnabled = true
            self.upcomingCollectionView.reloadData()
            
            self.upcomingCollectionView.isHidden = false
            self.noUpcomingEventsImageView.isHidden = true
            
        }
        else{
            self.upcomingCollectionView.isHidden = true
            self.noUpcomingEventsImageView.isHidden = false
        }
                   
    }
}
