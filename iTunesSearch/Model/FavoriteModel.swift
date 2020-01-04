//
//  FavoriteModel.swift
//  iTunesSearch
//
//  Created by Jorge Acosta on 03-01-20.
//  Copyright © 2020 Jorge Acosta. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import CoreData

class FavoriteModel : ObservableObject, ListModel {
    
    
    @Published var tracks:[Track] = []
    
    var context : NSManagedObjectContext
    
    init(context: NSManagedObjectContext){
        self.context = context
        self.retrieve()
    }
    
    func getPage() -> Int {
       0
    }
   
    func setPage(page: Int) {
 
    }
    
    func getTracks() -> [Track] {
        tracks
    }
    
    func favorite(track: Track){
        let item = NSEntityDescription.insertNewObject(forEntityName: "Favorite", into: context) as? Favorite
        item?.artworkUrl100 = track.artworkUrl100
        item?.collectionName = track.collectionName
        item?.trackName = track.trackName
        item?.country = track.country
        item?.artistName = track.artistName
        
        try! context.save()
        
        retrieve()
    }
    
    func retrieve(){
        
         let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Favorite")
         request.returnsObjectsAsFaults = false
         
      
         do {
           let result = try self.context.fetch(request) as! [NSManagedObject]
            self.tracks = result.map { fav in
                let item = fav as! Favorite
                var track = Track()
                track.artworkUrl100 = item.artworkUrl100!
                track.trackName = item.trackName!
                track.collectionName = item.collectionName!
                track.country = item.country!
                return track
            }
            debugPrint(result)
         } catch {
           
         
         }
    }
}
