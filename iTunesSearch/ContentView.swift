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

    var body: some View {
        let view: SearchTrack = container.resolve(from: .root)
        return view
    }
}

