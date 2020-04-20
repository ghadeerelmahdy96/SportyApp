//
//  SportsPresenter.swift
//  SportyApp
//
//  Created by Ghadeer El-Mahdy on 4/20/20.
//  Copyright © 2020 mad40. All rights reserved.
//

import Foundation
class SportsPresenter {
    static let getInstance = SportsPresenter()
    private var repo : RepositoryProtocol
     private init() {
        repo = RepositoryImp.getInstance
     }
    func getSports(completionHandler:@escaping (_ sports:[Sport])->Void) {
        repo.getSports { (list) in
            completionHandler(list)
        }
    }  
}
