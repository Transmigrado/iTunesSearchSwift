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
    @Published var isLoading = false
    
    var searchText = "" {
        didSet {
            retrieve(term: searchText)
        }
    }
    
    let api : Api
    
    init(api : Api){
        self.api = api
    }
    
    func retrieve(term:String){
        isLoading = true
        api.retrieve(urlString: "\(Constants.baseUrl)\(term)") { response in
            self.tracks = (response as! Page).results
            self.isLoading = false
        }
    }
    
}

