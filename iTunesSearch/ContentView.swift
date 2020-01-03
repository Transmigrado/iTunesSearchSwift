//
//  ContentView.swift
//  iTunesSearch
//
//  Created by Jorge Acosta on 02-01-20.
//  Copyright © 2020 Jorge Acosta. All rights reserved.
//

import SwiftUI
import Combine
import URLImage

struct ContentView: View {
    
    @ObservedObject var model : TrackModel
  
    var body: some View {
        List(model.tracks){ track in
            HStack{
                URLImage(URL(string: track.artworkUrl30)!)
                VStack(alignment: .leading, spacing: 0.0){
                    Text(track.artistName)
                        .bold()
                    Text(track.trackName)
                }
            }
        }
    }
}

