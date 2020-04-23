//
//  ShowToastView.swift
//  MovieMVP
//
//  Created by Ghadeer El-Mahdy on 4/13/20.
//  Copyright © 2020 Ghadeer El-Mahdy. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController{

func showToast(message : String) {
    let toastLabel = UILabel(frame: CGRect(
        x: self.view.frame.size.width/2 - 100,
        y: self.view.frame.size.height-200,
        width: 200 ,
        height: 35))
    toastLabel.backgroundColor = UIColor.black.withAlphaComponent(1)
    toastLabel.textColor = UIColor.white
    toastLabel.font.withSize(12.0)
    toastLabel.textAlignment = .center;
    toastLabel.text = message
    toastLabel.alpha = 1.0
    toastLabel.layer.cornerRadius = 10;
    toastLabel.clipsToBounds  =  true
    self.view.addSubview(toastLabel)
    UIView.animate(withDuration: 8.0, delay: 0.1, options: .curveEaseOut, animations: {
         toastLabel.alpha = 0.0
    }, completion: {(isCompleted) in
        toastLabel.removeFromSuperview()
    })
} }
