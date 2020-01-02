//
//  TrackModel.swift
//  iTunesSearch
//
//  Created by Jorge Acosta on 02-01-20.
//  Copyright © 2020 Jorge Acosta. All rights reserved.
//

import Combine
import Alamofire

class TrackModel : ObservableObject {
    
    @Published var tracks:[Track] = []
    
    let api = TrackApi()
    
    init(){
        retrieve()
    }
    
    func retrieve(){
        
        api.retrieve(urlString: Constants.baseUrl) { response in
            self.tracks = (response as! Page).results
        }
    }
    
}

