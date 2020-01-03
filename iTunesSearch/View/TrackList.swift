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
        @ObservedObject var audioModel = AudioModel()
        
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
                           Text("\(self.audioModel.progress)")
                    ForEach(self.model.tracks){ track in
                      Row(track: track)
                    }
                  
                   
                    if self.model.tracks.count > 0 {
                           self.loadingView
                      }
                }
                .onAppear{
                    self.audioModel.audioUrl = "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview82/v4/5d/71/ef/5d71efb7-2c40-0490-f137-9b86372f8fd5/mzaf_7873689062499888403.plus.aac.p.m4a"
                }
              
                 
            }
       }
}
