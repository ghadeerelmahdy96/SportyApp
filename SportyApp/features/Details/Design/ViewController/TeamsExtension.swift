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
               self.teamsCollectionView.reloadData()
               self.activityIndicator.stopAnimating()
               self.teamsCollectionView.isUserInteractionEnabled = true
           }
       }
       detailsPresenter.getTeams(leagueName: leagueName, completionHandler: closure)
    }
    
    func configureTeamsCell(cell : TeamCollectionViewCell , index : Int){
        
        cell.teamImageView.frame = CGRect(x: 0, y: 0, width: 296, height: 152)
        cell.teamImageView.kf.setImage(with: URL(string: teamsArray[index].strTeamBadge))
        cell.teamNameLabel.text = teamsArray[index].strTeam
        
    }
    
}

