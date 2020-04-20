//
//  LeaguesTableViewController.swift
//  SportyApp
//
//  Created by Ghadeer El-Mahdy on 4/20/20.
//  Copyright © 2020 mad40. All rights reserved.
//

import UIKit
import Kingfisher
class LeaguesTableViewController: UITableViewController {
    var sportTitle : String = ""
    var leagues : [League] = []
    private let peresnter = LeaguePresenter.getInstance
    override func viewDidLoad() {
        super.viewDidLoad()
      tableView.register(UINib(nibName: "LeagueCell", bundle: nil), forCellReuseIdentifier: "leagueCell")
        peresnter.getLeagues(sportName: sportTitle) { (list) in
            self.leagues = list
            self.tableView.reloadData()
        }
      
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        if leagues.count != 0{
           count = leagues.count
        }
        return count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "leagueCell", for: indexPath) as! LeagueCell
        let url = URL(string: leagues[indexPath.row].strBadge)
       cell.leagueImage.kf.setImage(with: url)
       cell.leagueTitle.text = leagues[indexPath.row].strLeague

        return cell
    }


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          let storyboard = UIStoryboard(name: "Details", bundle: nil)
                let controller = storyboard.instantiateViewController(identifier: "detailsView") as! DetailsViewController
        controller.leagueFromMain = leagues[indexPath.row]
        controller.modalPresentationStyle = .popover
        self.present(controller, animated: true, completion: nil)
    }
   

}
