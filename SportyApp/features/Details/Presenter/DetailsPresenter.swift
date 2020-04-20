//
//  DetailsPresenter.swift
//  SportyApp
//
//  Created by Yahya Ewida on 4/20/20.
//  Copyright © 2020 mad40. All rights reserved.
//

import Foundation

class DetailsPresenter : DetailsPresenterProtocol{
    
    private let repository = RepositoryImp.getInstance
    
    func getTeams( leagueName : String , completionHandler : @escaping ([Team]) -> Void) {
        repository.getTeams(byLeagueId: leagueName, completionHandler: completionHandler)
    }
    
    func getUpcomingEvents(byLeagueId: String,completionHandler:@escaping (_ result:[Event])->Void){
        repository.getUpcomingEvents(byLeagueId: byLeagueId, completionHandler: completionHandler)
    }
    
    func getLatestEvents(byLeagueId: String,completionHandler:@escaping (_ result:[Event])->Void){
        repository.getLatestEvents(byLeagueId: byLeagueId, completionHandler: completionHandler)
    }
    
}
