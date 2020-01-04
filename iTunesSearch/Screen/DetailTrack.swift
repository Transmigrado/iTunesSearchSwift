//
//  DetailTrack.swift
//  iTunesSearch
//
//  Created by Jorge Acosta on 03-01-20.
//  Copyright © 2020 Jorge Acosta. All rights reserved.
//

import SwiftUI
import URLImage
import Swinject

struct DetailTrack: View {
    
    var container: Container
    @ObservedObject var model : FavoriteModel
    
    var track = Track()
    
    private var isFavorite : Bool {
        get {
            model.tracks.contains { track in
                debugPrint( self.track.trackId, track.trackId)
                return self.track.trackId == track.trackId
            }
        }
    }

    var list: some View {
      let view: TrackList<TrackModel> = container.resolve(from: .trackListDetail)
      view.model.tracks = []
      view.model.searchText = track.collectionName
      return view
    }
    
    var header: some View {
        ZStack{
            URLImage(URL(string: track.artworkUrl100)!)
                .frame(minWidth: 0.0, maxWidth: .infinity)
                .frame( height: 100.0, alignment: .center)
                .blur(radius: 10)
                .scaleEffect(5.0)
            URLImage(URL(string: track.artworkUrl100)!)
                .shadow(radius: 10.0)
        }
        .frame(minWidth: 0.0, maxWidth: .infinity, maxHeight: 200.0, alignment: .center)
        .mask(Rectangle())
    }
    
    var body: some View {
        VStack(alignment: .leading){
          header
          VStack(alignment: .leading){
            HStack{
                Text(track.trackName)
                    .bold()
                    .font(.system(size: 22.0))
                 Spacer()
                Image(systemName: isFavorite ? "star.fill" : "star")
                    .foregroundColor(.yellow)
                    .onTapGesture {
                        self.model.favorite(track: self.track)
                    }
                
            }
            Text(track.collectionName)
            Text(track.artistName)
            Text("Pais: \(track.country)")
          }
          .padding(10.0)
          list
      }
      .frame(minWidth: 0.0, maxWidth: .infinity, minHeight: 0.0, maxHeight: .infinity, alignment: .topLeading)
 
    }
    
}

