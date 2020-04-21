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
               self.upcomingEventsArray = upComingEventsArrayNew
               self.upcomingCollectionView.reloadData()
               self.activityIndicator.stopAnimating()
               self.upcomingCollectionView.isUserInteractionEnabled = true
            print(self.upcomingEventsArray)
           }
       }
       detailsPresenter.getUpcomingEvents(byLeagueId: leagueId, completionHandler: closure)
       
    }
    
    func configureUpComingEventsCell(cell : UpcomingCollectionViewCell , index : Int) {
        cell.awayTeamLabel.text = upcomingEventsArray[index].strAwayTeam
        cell.homeTeamLabel.text = upcomingEventsArray[index].strHomeTeam
        cell.dateLabel.text = upcomingEventsArray[index].strDate
        cell.timeLabel.text = upcomingEventsArray[index].strTime
        //cell.homeImageView.kf.setImage(with: URL(string: upcomingEventsArray[index].home))
    }
}
