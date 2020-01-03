//
//  ContentView.swift
//  iTunesSearch
//
//  Created by Jorge Acosta on 02-01-20.
//  Copyright © 2020 Jorge Acosta. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model : TrackModel
    @State var searchText: String = ""
    
    var viewForResult : some View {
        List(model.tracks){ track in
            NavigationLink(destination: DetailTrack()){
              Row(track: track)
            }
        }
    }
    
    var searchBar : some View {
        HStack {
           HStack {
               Image(systemName: "magnifyingglass")
               TextField("Buscar", text: $searchText)
                    .foregroundColor(.primary)
               Button(action: {
                   self.searchText = ""
               }) {
                   Image(systemName: "xmark.circle.fill")
                    .opacity(searchText == "" ? 0 : 1)
               }
           }
           .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
           .foregroundColor(.secondary)
           .background(Color(.secondarySystemBackground))
           .cornerRadius(10.0)
       }
      .padding(.horizontal)
        
    }
    
    var body: some View {
        NavigationView{
            VStack{
                searchBar
                viewForResult
                    .navigationBarTitle("Buscar")
            }
        }
    }
}

