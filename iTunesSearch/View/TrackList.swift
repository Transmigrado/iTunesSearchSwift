//
//  TrackList.swift
//  iTunesSearch
//
//  Created by Jorge Acosta on 03-01-20.
//  Copyright © 2020 Jorge Acosta. All rights reserved.
//

import SwiftUI
import Swinject

struct TrackList: View {
        
        var container: Container
        @ObservedObject var model : TrackModel
        @ObservedObject var audioModel = AudioModel()
        
    
        func detail(track: Track) -> some View {
            var detail : DetailTrack = container.resolve(from : .detailTrack)
            detail.track = track
            return detail
        }
              
    
        var loadingView : some View {
            ZStack{
               LottieView()
                .frame(width: 264, height: 150.0, alignment: .center)
            }
            .frame(minWidth: 0.0, maxWidth: .infinity)
            .onAppear{
                self.model.page = self.model.page + 1
            }
        }
     
       var body: some View {
            GeometryReader { geometry in
                
                List{
                    
                    ForEach(self.model.tracks){ track in
                        NavigationLink(destination: self.detail(track: track)){
                            Row(track: track, trackId: self.$audioModel.trackId, progress: self.$audioModel.progress){
                                self.audioModel.audioUrl = track.previewUrl
                                self.audioModel.trackId = track.trackId
                            }
                        }
                    }
                   
                    if self.model.tracks.count > 0 {
                        self.loadingView
                    }
                }
              
                 
            }
       }
}
