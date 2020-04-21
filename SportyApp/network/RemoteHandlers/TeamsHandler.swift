//
//  TeamsHandler.swift
//  SportyApp
//
//  Created by Yahya Ewida on 4/18/20.
//  Copyright © 2020 mad40. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class TeamsHandler : RemoteHandlerProtocol {
    func fetchData(param:Any , completionHandler:@escaping (_ result:[Any])->Void){
        let strLeagueNew = (param as!String).replacingOccurrences(of: " ", with: "%20")
        
       Alamofire.request("https://www.thesportsdb.com/api/v1/json/1/search_all_teams.php?l=\(strLeagueNew)")
                .responseJSON { (response) in
                    if let data = response.data {
                       let teamsArary = self.parseSportsJson(responseData: data)
                       completionHandler(teamsArary)                    
                   }
               }
    }
    func parseSportsJson(responseData : Data) -> [Team]{
        
        var teamsArray = [Team]()
        
        if let teamsJsonArray = try? JSON(data: responseData) {
        for team in teamsJsonArray["teams"].arrayValue {
            let idTeam = team["idTeam"].intValue
            let intFormedYear = team["intFormedYear"].intValue
            let strKeywords = team["strKeywords"].stringValue
            let strYoutube = team["strYoutube"].stringValue
            let strStaduim = team["strStadium"].stringValue
            let strStadiumLocation = team["strStadiumLocation"].stringValue
            let strStadiumThumb = team["strStadiumThumb"].stringValue
            let intStadiumCapacity = team["intStadiumCapacity"].intValue
            let strTeamLogo = team["strTeamLogo"].stringValue
            let strTeamShort = team["strTeamShort"].stringValue
            let strTeamBadge = team["strTeamBadge"].stringValue
            let strTeam = team["strTeam"].stringValue
            teamsArray.append(Team(idTeam: idTeam, intFormedYear: intFormedYear, strKeywords: strKeywords, strYoutube: strYoutube, strStadium: strStaduim, strStadiumLocation: strStadiumLocation, strStadiumThumb: strStadiumThumb, intStadiumCapacity: intStadiumCapacity, strTeamLogo: strTeamLogo, strTeamShort: strTeamShort, strTeamBadge: strTeamBadge,strTeam: strTeam))
        
            }
        }
        return teamsArray
    }
    
    
}
