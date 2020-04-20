//
//  CoreDataPrtocol.swift
//  SportyApp
//
//  Created by Yahya Ewida on 4/20/20.
//  Copyright © 2020 mad40. All rights reserved.
//

import Foundation

protocol CoreDataPrtocol {
    func insertInLocalLeagues(league LeagueValue:League)  -> League
    func getFavouriteLeagues() -> [League]
    func deleteLeague(id : String)
}
