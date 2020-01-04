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
    }
}
