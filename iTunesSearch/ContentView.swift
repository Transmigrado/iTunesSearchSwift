//
//  ContentView.swift
//  iTunesSearch
//
//  Created by Jorge Acosta on 02-01-20.
//  Copyright © 2020 Jorge Acosta. All rights reserved.
//

import SwiftUI
import Swinject

struct ContentView: View {
    
    var container: Container
    
    var searchList: some View {
        let view: SearchTrack = container.resolve(from: .root)
        return view
    }
    
    var body: some View {
        
        
        TabView {
            searchList
                .tabItem({
                    VStack(alignment: .center){
                        Image(systemName: "magnifyingglass")
                        Text("Buscar")
                    }
                })
                .tag(0)
            Favorites()
                .tabItem({
                    VStack(alignment: .center){
                        Image(systemName: "star.fill")
                        Text("Favoritos")
                    }
                })
                .tag(1)
        }
    }
}

