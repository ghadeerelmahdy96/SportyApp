//
//  FavouritesViewController.swift
//  SportyApp
//
//  Created by Ghadeer El-Mahdy on 4/23/20.
//  Copyright © 2020 mad40. All rights reserved.
//

import UIKit

class FavouritesViewController: UIViewController , ReloadTableViewDelegate {
   //outlets
   
    @IBOutlet private weak var tableView: LeagueTableView!
      @IBOutlet weak var leaguesView: UIView!
      @IBOutlet weak var noDataView: UIView!
      private let peresnter = FavouritesPresenter.getInstance
      override func viewDidLoad() {
          super.viewDidLoad()
           setupTableView()
      }
    
    override func viewWillAppear(_ animated: Bool) {
           reloadYourTableView()
    }
      
      //table view
      private func setupTableView (){
          tableView.delegate = tableView
          tableView.dataSource = tableView
          tableView.register(UINib(nibName: "LeagueCell", bundle: nil), forCellReuseIdentifier: "leagueCell")
         tableView.ParentController = self
        tableView.FavouritesController = self
      }
      
    func reloadYourTableView() {
              peresnter.getLeagues() { (list) in
                if list.isEmpty {
                    self.noDataView.isHidden = false
                    self.leaguesView.isHidden = true
                }else{
                    self.noDataView.isHidden = true
                    self.leaguesView.isHidden = false
                    self.tableView.leagues = list
                    self.tableView.reloadData()
                }
               }
       }
       

}
