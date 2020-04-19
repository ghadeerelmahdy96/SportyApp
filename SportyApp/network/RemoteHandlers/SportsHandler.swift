//
//  SportsHandler.swift
//  SportyApp
//
//  Created by Yahya Ewida on 4/18/20.
//  Copyright © 2020 mad40. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON



class SportsHandler : RemoteHandlerProtocol{
    func fetchData(param:Any , completionHandler:@escaping (_ result:[Any])->Void){
        Alamofire.request("https://www.thesportsdb.com/api/v1/json/1/all_sports.php")
            .responseJSON { (response) in
                 if let data = response.data {
                    self.parseSportsJson(responseData: data,completionHandler: completionHandler)
                }
        }
    }
    
    func parseSportsJson(responseData : Data ,  completionHandler:@escaping (_ result:[Any])->Void){
       
        var sportsArray = [Sport]()
        
       if let sportsJsonArray = try? JSON(data: responseData) {
           for sport in sportsJsonArray["sports"].arrayValue {
                let idSport = sport["idSport"].intValue
                let strSport = sport["strSport"].stringValue
                let strSportThumb = sport["strSportThumb"].stringValue
                let strSportDescription = sport["strSportDescription"].stringValue
                
                sportsArray.append(Sport(idSport: idSport, strSport: strSport, strSportThumb: strSportThumb, strSportDescription: strSportDescription))
           }
        completionHandler(sportsArray)
       }
    }
   
}
    
    

