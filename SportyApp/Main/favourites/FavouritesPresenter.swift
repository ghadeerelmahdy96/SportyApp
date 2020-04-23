//
//  FavouritesPresenter.swift
//  SportyApp
//
//  Created by Ghadeer El-Mahdy on 4/23/20.
//  Copyright © 2020 mad40. All rights reserved.
//

import Foundation
class FavouritesPresenter {
     static let getInstance = FavouritesPresenter()
          private var repo : RepositoryProtocol
           private init() {
              repo = RepositoryImp.getInstance
           }
       func getLeagues(completionHandler:@escaping (_ sports:[League])->Void) {
          completionHandler( repo.getFavouriteLeagues())
       }
}
