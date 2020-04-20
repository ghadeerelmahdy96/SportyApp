//
//  HeaderCollectionReusableView.swift
//  SportyApp
//
//  Created by Ghadeer El-Mahdy on 4/19/20.
//  Copyright © 2020 mad40. All rights reserved.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    @IBOutlet weak var headerTitleLabel: UILabel!
    func populate(with item: String) {
        headerTitleLabel.text = item
    }
    
}
