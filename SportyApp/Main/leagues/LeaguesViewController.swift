//
//  LeaguesTableViewController.swift
//  SportyApp
//
//  Created by Ghadeer El-Mahdy on 4/20/20.
//  Copyright © 2020 mad40. All rights reserved.
//

import UIKit
import Kingfisher
class LeaguesViewController: UIViewController , ReachabilityObserverDelegate {
  

    //outlets
     
     @IBOutlet weak var leaguesView: UIView!
     @IBOutlet weak var internetView: UIView!

     //Actions
     
     @IBAction func retryInternet(_ sender: Any) {
            try? addReachabilityObserver()
         
     }
    @IBOutlet weak var tableView: LeagueTableView!

    var sportTitle : String = ""
    private let peresnter = LeaguePresenter.getInstance
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "\(sportTitle) Leagues"
        try? addReachabilityObserver()
        setupTableView()
        
        let indicator = getIndicatorActivity()
        view.addSubview(indicator)
        indicator.startAnimating()
        
        peresnter.getLeagues(sportName: sportTitle) { (list) in
            self.tableView.leagues = list
            indicator.stopAnimating()
            self.tableView.reloadData()
        }
      
    }
    
    //table view
    private func setupTableView (){

        tableView.delegate = tableView
        tableView.dataSource = tableView
        tableView.register(UINib(nibName: "LeagueCell", bundle: nil), forCellReuseIdentifier: "leagueCell")
       tableView.ParentController = self
    }
    //Internet
    func reachabilityChanged(_ isReachable: Bool) {
               if !isReachable {
                  // print("No internet connection")
                   internetView.isHidden = false
                   leaguesView.isHidden = true
               }else {
                 // print(" internet connection")
                   internetView.isHidden = true
                   leaguesView.isHidden = false
                    setupTableView()
               }
       }
       deinit {
           removeReachabilityObserver()
       }

}

extension UIViewController : PresentControllerDelegate {
    // delegation
    func present(controller: UIViewController) {
           self.present(controller, animated: true, completion: nil)
      }
}
