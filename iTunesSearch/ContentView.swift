//
//  ContentView.swift
//  iTunesSearch
//
//  Created by Jorge Acosta on 02-01-20.
//  Copyright © 2020 Jorge Acosta. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @ObservedObject var model : TrackModel
  
    var body: some View {
        List(model.tracks){ track in
            Text(track.trackName)
        }
    }
}

