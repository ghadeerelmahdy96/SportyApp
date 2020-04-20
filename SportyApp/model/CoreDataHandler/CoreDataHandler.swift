//
//  CoreDataHandler.swift
//  LeagueListNetwork
//
//  Created by Yahya Ewida on 4/1/20.
//  Copyright © 2020 Yahya. All rights reserved.
//
import UIKit
import Foundation
import CoreData

class CoreDataHandler : CoreDataPrtocol{
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private  var managedContext:NSManagedObjectContext?
    private static var instance = CoreDataHandler()
    
    private init () {
         managedContext = appDelegate.persistentContainer.viewContext
    }
    
    static func getCoreHandlerInstance() -> CoreDataHandler {
        return instance
    }
           
    func insertInLocalLeagues(league LeagueValue:League)  -> Bool {
        let entity = NSEntityDescription.entity(forEntityName: favouriteLeaguesTableName, in: managedContext!)
        var leagueNSManagedObject = NSManagedObject(entity: entity!, insertInto: managedContext!)
        
         leagueNSManagedObject = prepareNSManagedObject(leagueValue: LeagueValue, leagueNSManagedObject: leagueNSManagedObject)
        
        do{
            try managedContext!.save()
        }
        catch{
            print("error in insertInLocalLeagues")
            return false
        }
        return true
    }
    
     func getFavouriteLeagues() -> [League] {
       return fetchData()
    }
    
    
    
    private func fetchData() -> [League]{
        
        var leagues = [League]()
        var leaguesNSManagedOBjects = Array<NSManagedObject>()
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: favouriteLeaguesTableName)
        
        do{
            leaguesNSManagedOBjects = try managedContext!.fetch(fetchRequest)
            
            leaguesNSManagedOBjects.forEach({(object) in
                leagues.append(prepareLeagueObject(leagueNSManagedObject: object))
            })
        }
        catch{
            print("error in fetchData")
        }
        return leagues
    }
    
    private func prepareNSManagedObject(leagueValue:League,leagueNSManagedObject : NSManagedObject) -> NSManagedObject{
                
        leagueNSManagedObject.setValue(leagueValue.idLeague, forKey: "idLeague")
        leagueNSManagedObject.setValue(leagueValue.strLeague, forKey: "strLeague")
        leagueNSManagedObject.setValue(leagueValue.strSport, forKey: "strSport")
        leagueNSManagedObject.setValue(leagueValue.strBadge, forKey: "strBadge")
        leagueNSManagedObject.setValue(leagueValue.strYoutube, forKey: "strYoutube")
        
        return leagueNSManagedObject
    }
    
    private func prepareLeagueObject(leagueNSManagedObject : NSManagedObject) -> League{
        return
            League(idLeague: leagueNSManagedObject.value(forKey: "idLeague") as! String,
                            strLeague: leagueNSManagedObject.value(forKey: "strLeague") as! String,
                            strSport: leagueNSManagedObject.value(forKey: "strSport") as! String,
                            strBadge: leagueNSManagedObject.value(forKey: "strBadge") as! String,
                            strYoutube: leagueNSManagedObject.value(forKey: "strYoutube") as! String)
       
    }
        
    
    func deleteLeague(id : String){
        
        let leagueNSManagedObject = fetchLeagueById(id: id)
        
        if(leagueNSManagedObject == nil){
            return
        }
         managedContext?.delete(leagueNSManagedObject!)
        
        do{
            try managedContext!.save()
        }
        catch{
            print("error in deleteFromEntity")
        }
    }
    
    private func fetchLeagueById(id :String) -> NSManagedObject?{
       var leaguesNSManagedOBjects = Array<NSManagedObject>()
    
        let predicate = NSPredicate(format: "idLeague == %@",id)
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: favouriteLeaguesTableName)
        
        fetchRequest.predicate = predicate
               
       do{
           leaguesNSManagedOBjects = try managedContext!.fetch(fetchRequest)
       }
       catch{
           print("error in fetchData")
       }
        if(leaguesNSManagedOBjects.count > 0 ){
            return leaguesNSManagedOBjects[0]
        }
       return  nil
       }
    
    func isFavoriteLeague(id : String) -> Bool{
        if (fetchLeagueById(id: id) != nil){
            return true
        }
        return false
    }
    
}
