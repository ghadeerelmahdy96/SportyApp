//
//  LatestCollectionViewCell.swift
//  SportyApp
//
//  Created by Yahya Ewida on 4/19/20.
//  Copyright © 2020 mad40. All rights reserved.
//

import UIKit

class LatestCollectionViewCell: UICollectionViewCell {

    
    //Outlets
    @IBOutlet weak var homeLabel: UILabel!
    
    @IBOutlet weak var awayLabel: UILabel!
    
    @IBOutlet weak var homeScoreLabel: UILabel!
    
    
    @IBOutlet weak var awayScoreLabel: UILabel!
    
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
