//
//  LeagueTableView.swift
//  SportyApp
//
//  Created by Ghadeer El-Mahdy on 4/23/20.
//  Copyright © 2020 mad40. All rights reserved.
//

import UIKit

class LeagueTableView: UITableView , UITableViewDelegate , UITableViewDataSource {
    var ParentController : PresentControllerDelegate?
    var FavouritesController : ReloadTableViewDelegate?
    var leagues : [League] = []
    

    // MARK: - Table view data source

      func numberOfSections(in tableView: UITableView) -> Int {
         var count = 0
         if leagues.count != 0{
            count = leagues.count
         }
         return count
     }

      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return 1
     }


     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "leagueCell", for: indexPath) as! LeagueCell
        cell.myLeague = leagues[indexPath.section]
        
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        cell.clipsToBounds = true
        cell.layer.borderColor = CGColor(srgbRed: 0.5, green: 0.5, blue: 0.5, alpha: 1)
        
         return cell
     }


      func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           let storyboard = UIStoryboard(name: "Details", bundle: nil)
                 let controller = storyboard.instantiateViewController(identifier: "detailsView") as! DetailsViewController
         controller.leagueFromMain = leagues[indexPath.section]
         controller.favouritesController = FavouritesController
        controller.modalPresentationStyle = .popover
        ParentController?.present(controller: controller)
         
     }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
           if (FavouritesController != nil) {
               return true
           }
           return false
       }
         func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
                  if (editingStyle == .delete) {
                   self.FavouritesController?.showDeleteAlert(league: leagues[indexPath.section])
                  }
       }

     

  

}
