//
//  TrackList.swift
//  iTunesSearch
//
//  Created by Jorge Acosta on 03-01-20.
//  Copyright © 2020 Jorge Acosta. All rights reserved.
//

import SwiftUI

struct TrackList: View {
    
       @ObservedObject var model : TrackModel
       

       var body: some View {
            List(model.tracks){ track in
               NavigationLink(destination: DetailTrack(track:track)){
                    Row(track: track)
               }
            }
               
       }
}
