//
//  DetailsViewController.swift
//  SportyApp
//
//  Created by Yahya Ewida on 4/19/20.
//  Copyright © 2020 mad40. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController , DetailsControllerProtocol{

    //Outlets
    
    @IBOutlet weak var upcomingCollectionView: UICollectionView!
    @IBOutlet weak var latestCollectionView: UICollectionView!
    @IBOutlet weak var teamsCollectionView: UICollectionView!
    
    //Variables
    
    var detailsPresenter = DetailsPresenter()
    var activityIndicator : UIActivityIndicatorView = UIActivityIndicatorView()
    var upcomingEventsArray = [Event]()
    var latestEventsArray = [Event]()
    var teamsArray = [Team]()
    var league = "English Premier League"
    var leagueId = "4328"
    var leagueFromMain : League?
    //Functions
        
    override func viewDidLoad() {
        super.viewDidLoad()

        initializeCollectionViews()
        initializeActivityIndicator()
        getTeams(leagueName: league)
        getUpComingEvents(leagueId : leagueId)
        getLatestEvents(leagueId: leagueId)
    }
    
    private func initializeActivityIndicator(){
        
        activityIndicator.center = self.view.center
        activityIndicator.style = UIActivityIndicatorView.Style.medium
        activityIndicator.hidesWhenStopped = true
        let transform: CGAffineTransform = CGAffineTransform(scaleX: 8, y: 8)
        activityIndicator.transform = transform
        
        activityIndicator.startAnimating()
        upcomingCollectionView.isUserInteractionEnabled = false
        latestCollectionView.isUserInteractionEnabled = false
        teamsCollectionView.isUserInteractionEnabled = false
        
        self.view.addSubview(activityIndicator)
    }
    
    private func initializeCollectionViews(){
        
        // Assign Delegates
        
        upcomingCollectionView.delegate = self
        upcomingCollectionView.dataSource = self
        
        latestCollectionView.delegate = self
        latestCollectionView.dataSource = self
                
        teamsCollectionView.delegate = self
        teamsCollectionView.dataSource = self
        
        
        // Load Cells From Nib Files
        
        let upcomingNibCell = UINib(nibName: upcomingCellName, bundle: nil)
        upcomingCollectionView.register(upcomingNibCell, forCellWithReuseIdentifier: upcomingCellName)

        let latestNibCell = UINib(nibName: latestCellName, bundle: nil)

        latestCollectionView.register(latestNibCell, forCellWithReuseIdentifier: latestCellName)

        let teamsNibCell = UINib(nibName: teamCellName, bundle: nil)
        teamsCollectionView.register(teamsNibCell, forCellWithReuseIdentifier: teamCellName)
                        
        
    }
     

}
