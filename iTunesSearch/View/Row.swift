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
    @Binding var trackId : Int
    @Binding var progress: Double
    var action : (()->())
    
    private var isPlaying :Bool {
        get {
            trackId == track.trackId
        }
    }
    
    var progressCircle : some View {
        Circle()
            .trim(from: 0.0, to: CGFloat(progress / 30.0))
            .stroke(Color.blue, lineWidth: 4.0)
            .frame(width: 30.0, height: 30.0)
            .rotationEffect(.degrees(90))
    }
    
    var button : some View {
        ZStack{
            Circle()
                .foregroundColor(Color.white)
                .frame(width: 30, height: 30, alignment: .center)
                .opacity(0.5)
            Image(systemName: isPlaying ? "pause" : "play")
            if isPlaying {
                progressCircle
            }
        }
        .onTapGesture {
            self.action()
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

