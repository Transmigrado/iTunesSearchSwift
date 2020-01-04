//
//  TrackModel.swift
//  iTunesSearch
//
//  Created by Jorge Acosta on 02-01-20.
//  Copyright © 2020 Jorge Acosta. All rights reserved.
//

import Combine
import Alamofire

class TrackModel : ObservableObject, ListModel {
    
    
    @Published var tracks:[Track] = []
    @Published var isLoading = false
    
    var page: Int = 0 {
        didSet{
            retrieve(term: searchText)
        }
    }
    
    var searchText = "" {
        didSet {
            page = 0
            if searchText != ""{
                retrieve(term: searchText)
            } else {
                tracks = []
            }
            
        }
    }
    
    let api : Api
    
    init(api : Api){
        self.api = api
    }
    
    func getPage() -> Int {
        page
    }
    
    func setPage(page: Int) {
        self.page = page
    }
    
    func getTracks() -> [Track] {
        tracks
    }
    
    func retrieve(term:String){
        isLoading = true
        api.retrieve(urlString: "\(Constants.baseUrl)\(term)&offset=\(page * 20)") { response in
            self.tracks.append(contentsOf: response.results)
            self.isLoading = false
        }
    }
    
}

