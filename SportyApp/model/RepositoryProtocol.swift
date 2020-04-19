//
//  RepositoryProtocol.swift
//  SportyApp
//
//  Created by Ghadeer El-Mahdy on 4/19/20.
//  Copyright © 2020 mad40. All rights reserved.
//

import Foundation
protocol RepositoryProtocol {   
    func getSports(completionHandler:@escaping (_ result:[Sport])->Void)
    func getLeagues(bySportName : String,completionHandler:@escaping (_ result:[League])->Void)
    func getLatestEvents(byLeagueId: String,completionHandler:@escaping (_ result:[Event])->Void)
    func getUpcomingEvents(byLeagueId: String,completionHandler:@escaping (_ result:[Event])->Void)
    func getTeams(byLeagueId: String,completionHandler:@escaping (_ result:[Team])->Void)
}
