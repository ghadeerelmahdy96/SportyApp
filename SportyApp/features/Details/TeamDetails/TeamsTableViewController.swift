//
//  TeamsTableViewController.swift
//  SportyApp
//
//  Created by Yahya Ewida on 4/21/20.
//  Copyright © 2020 mad40. All rights reserved.
//

import UIKit
import Kingfisher
class TeamsTableViewController: UITableViewController {

    //Outlets
    @IBOutlet weak var stadiumImageView: UIImageView!
    @IBOutlet weak var teamLogoImageView: UIImageView!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var teamCreationYearLabel: UILabel!
    @IBOutlet weak var stadiumNameLabel: UILabel!
    
    @IBOutlet weak var stadiumLocationLabel: UILabel!
    
    @IBOutlet weak var stadiumCapacityLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    //Variables
    var teamFromLeagueDetails : Team?
    
    //Functinons
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        teamLogoImageView.layer.cornerRadius = teamLogoImageView.frame.size.width / 2
        teamLogoImageView.kf.setImage(with: URL(string: teamFromLeagueDetails?.strTeamBadge ?? ""),placeholder: UIImage(named: "noImageFound.jpg"))
        stadiumImageView.kf.setImage(with: URL(string: teamFromLeagueDetails?.strStadiumThumb ?? ""),placeholder: UIImage(named: "noImageFound.jpg"))
                
        teamNameLabel.text = teamFromLeagueDetails?.strTeam ?? ""
        
        
        teamCreationYearLabel.text = "Established in :" + String(teamFromLeagueDetails?.intFormedYear ?? 0)
       
        if teamFromLeagueDetails?.strStadium != "" || teamFromLeagueDetails?.strStadium != "null"{
            stadiumNameLabel.text! += teamFromLeagueDetails?.strStadium ?? ""
            stadiumCapacityLabel.text! += String(teamFromLeagueDetails?.intStadiumCapacity ?? 0)
            stadiumLocationLabel.text! += teamFromLeagueDetails?.strStadiumLocation ?? ""
            
            
        }else{
            stadiumNameLabel.text = ""
            stadiumCapacityLabel.text = ""
            stadiumLocationLabel.text = ""
        }
        descriptionLabel.text = teamFromLeagueDetails?.strDescriptionEN ?? ""
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }



}
