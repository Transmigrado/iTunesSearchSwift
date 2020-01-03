//
//  Row.swift
//  iTunesSearch
//
//  Created by Jorge Acosta on 03-01-20.
//  Copyright © 2020 Jorge Acosta. All rights reserved.
//

import SwiftUI
import URLImage

struct Row: View {
    
    var track : Track
    
    var body: some View {
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

