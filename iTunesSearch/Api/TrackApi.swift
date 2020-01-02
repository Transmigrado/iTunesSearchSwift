//
//  TrackApi.swift
//  iTunesSearch
//
//  Created by Jorge Acosta on 02-01-20.
//  Copyright © 2020 Jorge Acosta. All rights reserved.
//

import Foundation

struct TrackApi : Api {
 
    
   
    func retrieve(urlString: String, handler: @escaping  ((String)->Void))  {
        handler("hello world")
    }
}
