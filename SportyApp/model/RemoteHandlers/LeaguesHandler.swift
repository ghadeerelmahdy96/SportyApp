//
//  LeagueHandler.swift
//  SportyApp
//
//  Created by Yahya Ewida on 4/18/20.
//  Copyright © 2020 mad40. All rights reserved.
//

import Foundation
import Alamofire_SwiftyJSON
import Alamofire
import SwiftyJSON
class LeaguesHandler : RemoteHandlerProtocol{
    func fetchData(param:Any , completionHandler:@escaping (_ result:[Any])->Void){
        
    }
    

    func fetch(completionHandler:@escaping (_ leagues:[League])->Void) {
        let json =  requestJson(url: "\(BASE_URL)all_leagues.php",param: "leagues",completionHandler: { (arr) in
            for json in arr {
              let dic = json.dictionaryObject!
              let leagueList = self.parseResultDic(dic: dic)
              completionHandler(leagueList)
            }
        })
        
     
    }
    func requestJson (url : String,param : String,completionHandler:@escaping (_ leagues:[JSON])->Void ) {
        var resDic : [JSON] = []
        Alamofire.request(url)
                  .responseSwiftyJSON { (response) in
                      if let json = response.value {
                        resDic = self.parseJson(json: json, param: param)
                        completionHandler(resDic)
                      }
              }
    }
    func parseJson(json : JSON, param : String) -> [JSON] {
        var resArr : [JSON] = []
        if let dic = json.dictionary {
            if let arr = dic[param]?.arrayValue{
              resArr = arr
            }
        }
        return resArr
    }
    func parseResultDic(dic : Dictionary<String,Any>) -> [League] {
        var leagueList : [League] = []
        let idleague = dic["idLeague"] as? String
        print("\(idleague ?? "null")\n")
       requestJson(url: "\(BASE_URL)lookupleague.php?id=\(Int.init(idleague!) ?? -1)",param: "leagues",completionHandler: { (arr) in
        for json in arr {
            let dic = json.dictionaryObject!
            let strLeague = dic["strLeague"] as? String
            let strSport = dic["strSport"] as? String
            let strBadge = dic["strBadge"] as? String
            let strYoutube = dic["strYoutube"] as? String
            leagueList.append(League(idLeague: idleague ?? "null" , strLeague: strLeague ?? "null", strSport: strSport ?? "null", strBadge: strBadge ?? "null", strYoutube: strYoutube ?? "null"))
        }
           print(leagueList[0])
        })
        
        
        return leagueList
    }
    
}
//func parseSportsJson(responseData : Data){
//
//        var sportsArray = [Sport]()
//
//       if let sportsJsonArray = try? JSON(data: responseData) {
//           for sport in sportsJsonArray["sports"].arrayValue {
//                let idSport = sport["idSport"].intValue
//                let strSport = sport["strSport"].stringValue
//                let strSportThumb = sport["strSportThumb"].stringValue
//                let strSportDescription = sport["strSportDescription"].stringValue
//
//                sportsArray.append(Sport(idSport: idSport, strSport: strSport, strSportThumb: strSportThumb, strSportDescription: strSportDescription))
//           }
//       }
//    }
//
