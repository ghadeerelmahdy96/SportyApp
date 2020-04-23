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
        teamLogoImageView.kf.setImage(with: URL(string: teamFromLeagueDetails?.strTeamBadge ?? ""),placeholder: UIImage(named: ""))
        stadiumImageView.kf.setImage(with: URL(string: teamFromLeagueDetails?.strStadiumThumb ?? ""),placeholder: UIImage(named: ""))
                
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

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
