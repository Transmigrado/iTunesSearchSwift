//
//  DetailTrack.swift
//  iTunesSearch
//
//  Created by Jorge Acosta on 03-01-20.
//  Copyright © 2020 Jorge Acosta. All rights reserved.
//

import SwiftUI

struct DetailTrack: View {
    
    var track:Track
    
    var body: some View {
        VStack{
            Text(track.collectionName)
            Text(track.artistName)
            Text(track.trackName)
            Text(track.country)
        }
    }
}

