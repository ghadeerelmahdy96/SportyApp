//
//  DetailsViewController.swift
//  SportyApp
//
//  Created by Yahya Ewida on 4/19/20.
//  Copyright © 2020 mad40. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{

    //Outlets
    @IBOutlet weak var upcomingCollectionView: UICollectionView!
    @IBOutlet weak var latestCollectionView: UICollectionView!
    @IBOutlet weak var teamsCollectionView: UICollectionView!
    
    //Variables
    
    var upcomingEventsArray = [Event]()
    var latestEventsArray = [Event]()
    var teamsArray = [Team]()
    
    //Functions
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        upcomingCollectionView.delegate = self
        upcomingCollectionView.dataSource = self
        
        latestCollectionView.delegate = self
        latestCollectionView.dataSource = self
        
        teamsCollectionView.delegate = self
        teamsCollectionView.dataSource = self
        
        
        // Do any additional setup after loading the view.
        let upcomingNibCell = UINib(nibName: "UpcomingCollectionViewCell", bundle: nil)
        upcomingCollectionView.register(upcomingNibCell, forCellWithReuseIdentifier: "UpcomingCollectionViewCell")
        
        let latestNibCell = UINib(nibName: "LatestCollectionViewCell", bundle: nil)
        
        latestCollectionView.register(latestNibCell, forCellWithReuseIdentifier: "LatestCollectionViewCell")
        
        let teamsNibCell = UINib(nibName: "TeamCollectionViewCell", bundle: nil)
        teamsCollectionView.register(teamsNibCell, forCellWithReuseIdentifier: "TeamCollectionViewCell")
         
         
    
       /* var flowLayout = upcomingCollectionView.collectionViewLayout as? UICollectionViewFlowLayout
        if flowLayout == nil{
                    let itemsPerRow:CGFloat = 1
                    let lineSpacing:CGFloat = 5
                    let interItemSpacing:CGFloat = 5
        //13
                    
                    let width = upcomingCollectionView.frame.size.width
        //            let width = sportsCollectionView.frame.size.width / itemsPerRow
                    let height = width
                    flowLayout = UICollectionViewFlowLayout()
            flowLayout?.itemSize = CGSize(width: width, height: height)
            flowLayout?.sectionInset = UIEdgeInsets(top: lineSpacing, left: lineSpacing, bottom: 0, right: lineSpacing)

            upcomingCollectionView.setCollectionViewLayout(flowLayout!, animated: true)
                }*/
        
        /*if let flowLayout = upcomingCollectionView.collectionViewLayout as? UICollectionViewFlowLayout{
                   let cellWidth = UIScreen.main.bounds.width - 5
                   flowLayout.itemSize = CGSize(width: cellWidth, height: cellWidth)
               }*/
        /*
        if let flowLayout = latestCollectionView.collectionViewLayout as? UICollectionViewFlowLayout{
            let cellWidth = UIScreen.main.bounds.width / 2 - 5
            flowLayout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        }
        
        if let flowLayout = teamsCollectionView.collectionViewLayout as? UICollectionViewFlowLayout{
            let cellWidth = UIScreen.main.bounds.width / 2 - 5
            flowLayout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        }*/
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 238, height: 209)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       if collectionView == upcomingCollectionView{
       // return upcomingEventsArray.count
               
       }else if collectionView == latestCollectionView{
        //return latestEventsArray.count
       }else if collectionView == teamsCollectionView{
          // return teamsArray.count
       }
        return 10
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    //func collectionView(_ collectionView:UICollectionView,layout collectionViewLayout:UICollectionLa)
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == upcomingCollectionView{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UpcomingCollectionViewCell", for: indexPath) as! UpcomingCollectionViewCell
        
            cell.awayTeamLabel.text = "away Label"
            cell.homeTeamLabel.text = "home label"
            cell.dateLabel.text = "19-4-2020"
            cell.timeLabel.text = "06:54 PM"
        cell.vsLabel.text = "VS"
            return cell
                   
           }else if collectionView == latestCollectionView{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LatestCollectionViewCell", for: indexPath) as! LatestCollectionViewCell
            cell.awayLabel.text = "away Label"
            cell.homeLabel.text = "home label"
            cell.dateLabel.text = "19-4-2020"
            cell.timeLabel.text = "06:54 PM"
            cell.awayScoreLabel.text = "2"
            cell.homeScoreLabel.text = "1"
            return cell
              
           }else if collectionView == teamsCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TeamCollectionViewCell", for: indexPath) as! TeamCollectionViewCell
            cell.teamImageView.image = UIImage(named: "FilledStar.png")
            cell.teamNameLabel.text = "team Name"
            
            return cell
           }
        return UICollectionViewCell()
    }
    
    
    

}
