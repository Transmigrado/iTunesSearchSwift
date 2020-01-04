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
   @State var searchText = ""
    
    var searchBar : some View {
     HStack {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Buscar", text: self.$searchText)
                 .foregroundColor(.primary)
            Button(action: {
                self.searchText = ""
            }) {
                Image(systemName: "xmark.circle.fill")
                 .opacity(self.searchText == "" ? 0 : 1)
            }
        }
        .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
        .foregroundColor(.secondary)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(10.0)
    }
   .padding(.horizontal)
     
 }
    
  var list: some View {
    let view: TrackList<TrackModel> = container.resolve(from: .trackList)
    view.model.searchText = self.searchText
    return view
  }
   
  var body: some View {
      NavigationView{
          VStack{
             searchBar   
             list
                .navigationBarTitle("Buscar")
          }
      }
  }
}

