//
//  ContentCollectionViewCell.swift
//  SportyApp
//
//  Created by Ghadeer El-Mahdy on 4/19/20.
//  Copyright © 2020 mad40. All rights reserved.
//

import UIKit
import Kingfisher
class ContentCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var sportImageView: UIImageView!
    
    @IBOutlet weak var sportTitleLabel: UILabel!
    func populate(with sport: String , andImage img: String) {
         sportTitleLabel.text = sport
         let url = URL(string: img )
        sportImageView.kf.setImage(with: url)
        backgroundColor = UIColor.darkGray.withAlphaComponent(0.5)
     }
}
