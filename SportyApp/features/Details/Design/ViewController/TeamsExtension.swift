//
//  TeamsExtension.swift
//  SportyApp
//
//  Created by Yahya Ewida on 4/20/20.
//  Copyright © 2020 mad40. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension DetailsViewController{

    func getTeams(leagueName : String){
       let closure = { (teamsArrayNew:[Team]) -> Void in
           DispatchQueue.main.async {
                self.teamsArray = teamsArrayNew
                self.teamsCollectionView.isUserInteractionEnabled = true
                self.teamsCollectionView.reloadData()
                self.upcomingCollectionView.reloadData()
                self.latestCollectionView.reloadData()
                self.activityIndicator.stopAnimating()
                self.isTeamDataLoaded = true
                    
           }
       }
       detailsPresenter.getTeams(leagueName: leagueName, completionHandler: closure)
    }
    
    func configureTeamsCell(cell : TeamCollectionViewCell , index : Int){
                       
        cell.teamImageView.kf.setImage(with: URL(string: teamsArray[index].strTeamBadge))
        cell.teamNameLabel.text = teamsArray[index].strTeam
        
    }
    
}

