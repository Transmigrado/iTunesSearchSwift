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

class FavoriteModel : ObservableObject {
    
    var context : NSManagedObjectContext
    
    init(context: NSManagedObjectContext){
        self.context = context
        self.retrieve()
    }
    
    func favorite(track: Track){
        let item = NSEntityDescription.insertNewObject(forEntityName: "Favorite", into: context) as? Favorite
        item?.artworkUrl100 = track.artworkUrl100
        item?.collectionName = track.collectionName
        item?.trackName = track.trackName
        item?.country = track.country
        
        try! context.save()
    }
    
    func retrieve(){
        
         let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Favorite")
         request.returnsObjectsAsFaults = false
         
      
         do {
           let result = try self.context.fetch(request) as! [NSManagedObject]
            debugPrint(result)
         } catch {
           
         
         }
    }
}
