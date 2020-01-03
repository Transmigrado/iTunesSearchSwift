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
    
        var loading : some View {
            ZStack{
                LottieView()
                .frame(width: 264, height: 150.0, alignment: .center)
            }
            .frame(minWidth: 0.0, maxWidth: .infinity)
        }
       
       var body: some View {
            List{
              ForEach(model.tracks){ track in
                  NavigationLink(destination: DetailTrack(track:track)){
                       Row(track: track)
                  }
               }
                loading
            }
               
       }
}
