//
//  ContentView.swift
//  iTunesSearch
//
//  Created by Jorge Acosta on 02-01-20.
//  Copyright © 2020 Jorge Acosta. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model : TrackModel
  
    var body: some View {
        NavigationView{
            List(model.tracks){ track in
                NavigationLink(destination: DetailTrack()){
                  Row(track: track)
                }
            }
            .navigationBarTitle("Buscar")
        }
    }
}

