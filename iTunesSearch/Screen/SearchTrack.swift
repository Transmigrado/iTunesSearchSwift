//
//  SearchTrack.swift
//  iTunesSearch
//
//  Created by Jorge Acosta on 03-01-20.
//  Copyright © 2020 Jorge Acosta. All rights reserved.
//

import SwiftUI
import Swinject

struct SearchTrack: View {
     
    var container: Container
    
    var list: some View {
        let view: TrackList = container.resolve(from: .trackList)
        return view
    }
    
  var body: some View {
      NavigationView{
          VStack{
             list
          }
      }
  }
}

