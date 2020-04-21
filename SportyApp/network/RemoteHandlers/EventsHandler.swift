//
//  EventsHandler.swift
//  SportyApp
//
//  Created by Yahya Ewida on 4/18/20.
//  Copyright © 2020 mad40. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class EventsHandler : RemoteHandlerProtocol{
    func fetchData(param:Any , completionHandler:@escaping (_ result:[Any])->Void){
        let search = param as! Dictionary<String, Int>
        let eventStatus =  search["status"] == LATEST_EVENT ? "past" : "next"
        let idLeague : Int = search["idLeague"]!
        var eventList : [Event] = []
        requestJson(url: "\(BASE_URL)events\(eventStatus)league.php?id=\(idLeague)", key: "events") { (arr) in
            for json in arr {
              let dic = json.dictionaryObject!
              var event = self.parseResultDic(dic: dic)
               // print("event \(event)")
                  eventList.append(event)
            }
           //self.completeTeamDetailsInEvent(eventList: eventList)
           completionHandler(eventList)
        }
    }
   private func parseResultDic(dic : Dictionary<String,Any>) -> Event {
           let idEvent = dic["idEvent"] as? String
             let strEvent = dic["strEvent"] as? String
             let strHomeTeam = dic["strHomeTeam"] as? String
             let strAwayTeam = dic["strAwayTeam"] as? String
             let intHomeScore = dic["intHomeScore"] as? String
             let intAwayScore = dic["intAwayScore"] as? String
            let idHomeTeam = dic["idHomeTeam"] as? String
            let idAwayTeam = dic["idAwayTeam"] as? String
            let strDate = dic["dateEvent"] as? String
          let strTime = dic["strTime"] as? String
        
         return  Event(idEvent: idEvent ?? "null", strEvent: strEvent ?? "null", strHomeTeam: strHomeTeam ?? "null", strAwayTeam: strAwayTeam ?? "null", intHomeScore: intHomeScore  ?? "null", intAwayScore: intAwayScore ?? "null", idHomeTeam: idHomeTeam ?? "null", idAwayTeam: idAwayTeam ?? "null", strDate: strDate ?? "null", strTime: strTime ?? "null",strHomeTeamLogo: "" , strAwayTeamLogo: "")
     }
    
    private func getTeamDetails(teamId :String) -> String{
       
        
            
        var value = ""
        DispatchQueue.global().sync {
            Alamofire.request("https://www.thesportsdb.com/api/v1/json/1/lookupteam.php?id=\(teamId)")
                          .responseJSON { (response) in
                               if let data = response.data {
                                  if let teamDetailsArray = try? JSON(data: data) {
                                           for team in teamDetailsArray["teams"].arrayValue {
                                            value = team["strTeamLogo"].stringValue
                                    }
                                }
                              }
            }
        }
    
        return value
    }
    private func completeTeamDetailsInEvent(eventList : [Event]){
        
        for var event in eventList{
            event.strHomeTeamLogo = getTeamDetails(teamId: event.idHomeTeam)
        }
    }

    
}
