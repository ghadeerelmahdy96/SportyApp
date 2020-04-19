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
        var leagueList : [League] = []
             requestJson(url: "\(BASE_URL)all_leagues.php",key: "leagues",completionHandler: { (arr) in
                 for json in arr {
                   let dic = json.dictionaryObject!
                   let strSport = dic["strSport"] as! String
                   if(strSport == param as! String ){
                       self.parseResultDic(dic: dic, completionHandler: { (league) in
                          leagueList.append(league)
                        completionHandler(leagueList)
                       })
                   }
                 }      
             })
    }
  func parseResultDic(dic : Dictionary<String,Any>,completionHandler:@escaping (_ leagues:League)->Void)
      {
          let idleague = dic["idLeague"] as? String
        requestJson(url: "\(BASE_URL)lookupleague.php?id=\(Int.init(idleague!) ?? -1)",key: "leagues",completionHandler: { (arr) in
              let dic = arr[0].dictionaryObject!
              let strLeague = dic["strLeague"] as? String
              let strSport = dic["strSport"] as? String
              let strBadge = dic["strBadge"] as? String
              let strYoutube = dic["strYoutube"] as? String
              let league = League(idLeague: idleague ?? "null" , strLeague: strLeague ?? "null", strSport: strSport ?? "null", strBadge: strBadge ?? "null", strYoutube: strYoutube ?? "null")
             completionHandler(league)
          })
      }
}

extension RemoteHandlerProtocol {
    func requestJson (url : String,key : String,completionHandler:@escaping (_ leagues:[JSON])->Void ) {
        var resDic : [JSON] = []
        Alamofire.request(url)
                  .responseSwiftyJSON { (response) in
                      if let json = response.value {
                        resDic = self.parseJson(json: json,key: key)
                        completionHandler(resDic)
                      }
              }
    }
    func parseJson(json : JSON, key : String) -> [JSON] {
        var resArr : [JSON] = []
        if let dic = json.dictionary{
            if let arr = dic[key]?.arrayValue{
                resArr = arr
            }
        }
        return resArr
    }
}
