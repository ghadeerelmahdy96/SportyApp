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
    
    @IBOutlet weak var leagueImage: UIImageView!
    
    @IBOutlet weak var leagueTitle: UILabel!
    //action
    @IBAction func youtubeBtn(_ sender: Any) {
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        leagueImage.layer.cornerRadius = leagueImage.frame.size.width/2
        leagueImage.layer.borderColor = CGColor.init(srgbRed: 0.5, green: 0.5, blue: 0.5, alpha: 0.3)
        leagueImage.layer.borderWidth = 1.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
