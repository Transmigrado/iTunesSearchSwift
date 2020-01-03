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
        
        var loadingView : some View {
            ZStack{
                LottieView()
                .frame(width: 264, height: 150.0, alignment: .center)
            }
            .frame(minWidth: 0.0, maxWidth: .infinity)
            .onAppear{
                debugPrint("Hola")
            }
        }
       
       var body: some View {
            GeometryReader { geometry in
                List{
                                    
                    ForEach(self.model.tracks){ track in
                      Row(track: track)
                    }
                  
                   
                    if self.model.tracks.count > 0 {
                           self.loadingView
                      }
                }
              
                 
            }
       }
}
