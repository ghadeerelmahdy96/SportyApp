//
//  ViewController.swift
//  SportyApp
//
//  Created by Ghadeer El-Mahdy on 4/17/20.
//  Copyright © 2020 mad40. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let l = RepositoryImp.getInstance
//        l.getUpcomingEvents(byLeagueId: "4328", completionHandler: {(list) in
//             print("\(list)")
//            })
//        l.getLeagues(bySportName: "Motorsport", completionHandler: {(list) in
//                  print("my list \(list)\n")
//            print(list.count)
//            })
//        print(l.getSports(completionHandler: { (list) in
//            print("\(list)")
//        }))
        
//        let s = LeaguesHandler()
//        s.fetchData(param: "Soccer") { (list) in
//
//            print(" my list \(list)\n")
//        }
        
        let league = League(idLeague: "2", strLeague: "La League", strSport: "Soccer", strBadge: "dsadsadsasd", strYoutube: "youtube.com")
        CoreDataHandler.getCoreHandlerInstance().insertInLocalLeagues(league: league)
        
        CoreDataHandler.getCoreHandlerInstance().deleteLeague(id : "1")
        
        let leagues = CoreDataHandler.getCoreHandlerInstance().getFavouriteLeagues()
        print(leagues)
    }


}

