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
    
    var button : some View {
        ZStack{
            Circle()
                .foregroundColor(Color.white)
                .frame(width: 30, height: 30, alignment: .center)
                .opacity(0.5)
            Image(systemName: "play")
        }
        .onTapGesture {
            debugPrint("hola")
        }
    }
    
    var body: some View {
        HStack{
            URLImage(URL(string: track.artworkUrl100)!)
                .frame(width: 100.0, height: 100.0, alignment: .center)
                .overlay(button)
            VStack(alignment: .leading, spacing: 0.0){
                Text(track.trackName)
                    .bold()
                    .lineLimit(2)
                Text(track.artistName)
            }
        }
    }
}

