//
//  TrackApi.swift
//  iTunesSearch
//
//  Created by Jorge Acosta on 02-01-20.
//  Copyright © 2020 Jorge Acosta. All rights reserved.
//

import Foundation
import Alamofire

struct TrackApi : Api {
    
    func retrieve(urlString: String, handler: @escaping ((Any)->Void))  {

        AF.request(URL(string: urlString)!)
            .responseJSON { response in
                do {
                    let data = try JSONDecoder().decode(Track.self, from: response.data!)
                    handler(data)
                } catch {
                   
                }
            }
    }
}
