//
//  LeagueCell.swift
//  SportyApp
//
//  Created by Ghadeer El-Mahdy on 4/20/20.
//  Copyright © 2020 mad40. All rights reserved.
//

import UIKit

class LeagueCell: UITableViewCell {
//outlets
    @IBOutlet weak var sportTitle: UILabel!
    
    @IBOutlet weak var leagueImage: UIImageView!
    
    @IBOutlet weak var leagueTitle: UILabel!
    //action
    @IBAction func youtubeBtn(_ sender: Any) {
             var url = NSURL(string:youtubeURL)! as URL
            if UIApplication.shared.canOpenURL(url ){
                UIApplication.shared.open(url, options: [ : ], completionHandler: nil)
             } else{
                url = NSURL(string:"https://\(youtubeURL)")! as URL
                    UIApplication.shared.open(url, options: [ : ], completionHandler: nil)
            }
    }
    //var
    var youtubeURL : String = ""
    var myLeague : League? {
        willSet(league) {
            youtubeURL = league!.strYoutube
            let url = URL(string: league!.strBadge)
            leagueImage.kf.setImage(with: url)
            leagueTitle.text = league?.strLeague
            sportTitle.text = league?.strSport
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        leagueImage.translatesAutoresizingMaskIntoConstraints = false
        leagueImage.layer.cornerRadius = leagueImage.frame.size.width/2
        leagueImage.layer.borderColor = CGColor.init(srgbRed: 0.5, green: 0.5, blue: 0.5, alpha: 0.3)
        leagueImage.layer.borderWidth = 1.0
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
