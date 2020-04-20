//
//  LeaguePresenter.swift
//  SportyApp
//
//  Created by Ghadeer El-Mahdy on 4/20/20.
//  Copyright © 2020 mad40. All rights reserved.
//

import Foundation
class LeaguePresenter {
    static let getInstance = LeaguePresenter()
       private var repo : RepositoryProtocol
        private init() {
           repo = RepositoryImp.getInstance
        }
    func getLeagues(sportName : String,completionHandler:@escaping (_ sports:[League])->Void) {
        repo.getLeagues(bySportName: sportName) { (list) in
            completionHandler(list)
        }
    }
}
