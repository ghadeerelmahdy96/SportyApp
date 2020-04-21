//
//  DetailsPresenterProtocol.swift
//  SportyApp
//
//  Created by Yahya Ewida on 4/20/20.
//  Copyright © 2020 mad40. All rights reserved.
//

import Foundation

protocol DetailsPresenterProtocol {
    
    func getTeams( leagueName : String , completionHandler : @escaping ([Team]) -> Void)
    
    func getUpcomingEvents(byLeagueId: String,completionHandler:@escaping (_ result:[Event])->Void)
    
    func getLatestEvents(byLeagueId: String,completionHandler:@escaping (_ result:[Event])->Void)
    
    func insertIntoFavoriteLeagues(league : League) -> Bool
    
    func deleteFavoriteLeague(id : String)
    
    func isFavoriteLeague(id : String) -> Bool
    
}
