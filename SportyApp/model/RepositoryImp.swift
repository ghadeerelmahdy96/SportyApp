//
//  RepositoryImp.swift
//  SportyApp
//
//  Created by Ghadeer El-Mahdy on 4/19/20.
//  Copyright © 2020 mad40. All rights reserved.
//

import Foundation
class RepositoryImp : RepositoryProtocol {
    private let sportsHandler : RemoteHandlerProtocol
    private let leaguesHandler : RemoteHandlerProtocol
    private let eventsHandler : RemoteHandlerProtocol
    private let teamsHandler : RemoteHandlerProtocol
    static let getInstance = RepositoryImp()
    private let coreDataHandler : CoreDataPrtocol
       
    private init() {
       sportsHandler = SportsHandler()
       leaguesHandler = LeaguesHandler()
       eventsHandler = EventsHandler()
       teamsHandler = TeamsHandler()
       coreDataHandler = CoreDataHandler.getCoreHandlerInstance()
    }
    func getSports(completionHandler:@escaping (_ result:[Sport])->Void)  {
        sportsHandler.fetchData(param: "") { (sportsList) in
             completionHandler(sportsList as! [Sport])
        }
    }
    
    func getLeagues(bySportName: String,completionHandler:@escaping (_ result:[League])->Void) {
        leaguesHandler.fetchData(param: bySportName) { (leagueList) in
            completionHandler( leagueList as! [League])
        }
    }
    
    func getLatestEvents(byLeagueId: String,completionHandler:@escaping (_ result:[Event])->Void)  {
        
        var search : Dictionary<String, Int> = Dictionary.init()
        search["status"] = LATEST_EVENT
        search["idLeague"] = Int.init(byLeagueId)
        eventsHandler.fetchData(param: search) { (eventList) in
           completionHandler( eventList as! [Event])
        }
    }
    
    func getUpcomingEvents(byLeagueId: String,completionHandler:@escaping (_ result:[Event])->Void) {
        var search : Dictionary<String, Int> = Dictionary.init()
        search["status"] = UPCOMING_EVENT
        search["idLeague"] = Int.init(byLeagueId)
        eventsHandler.fetchData(param: search) { (eventList) in
                   completionHandler( eventList as! [Event])
               }
    }
    
    func getTeams(byLeagueId: String,completionHandler:@escaping (_ result:[Team])->Void) {
        teamsHandler.fetchData(param: byLeagueId) { (teamsList) in
            completionHandler( teamsList as! [Team])
        }
    }
    
    func insertInLocalLeagues(league leagueValue: League) -> Bool {
        return coreDataHandler.insertInLocalLeagues(league: leagueValue)
    }
       
   func getFavouriteLeagues() -> [League] {
        return coreDataHandler.getFavouriteLeagues()
   }
       
   func deleteLeague(id: String) {
        coreDataHandler.deleteLeague(id: id)
   }
    func isFavoriteLeague(id : String) -> Bool{
        return coreDataHandler.isFavoriteLeague(id: id)
    }
    
}
