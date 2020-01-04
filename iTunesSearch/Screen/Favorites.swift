//
//  Favorites.swift
//  iTunesSearch
//
//  Created by Jorge Acosta on 03-01-20.
//  Copyright © 2020 Jorge Acosta. All rights reserved.
//

import SwiftUI
import Swinject

struct Favorites: View {
    
    var container : Container
    @ObservedObject var model : FavoriteModel
    
     var list: some View {
       let view: TrackList<FavoriteModel> = container.resolve(from: .favoritesList)
       return view
     }
      
     var body: some View {
         NavigationView{
              list
                .navigationBarTitle("Favoritos")
         }
     }
}
