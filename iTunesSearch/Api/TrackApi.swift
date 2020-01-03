//
//  TrackApi.swift
//  iTunesSearch
//
//  Created by Jorge Acosta on 02-01-20.
//  Copyright © 2020 Jorge Acosta. All rights reserved.
//

import Foundation
import Alamofire

protocol Api {
    func retrieve(urlString: String, handler: @escaping  ((Any)->Void))
}

struct TrackApi : Api {
    
    func retrieve(urlString: String, handler: @escaping ((Any)->Void))  {
       
        AF.request(URL(string: urlString.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)!)!)
            .responseJSON { response in
                do {
                    let data = try JSONDecoder().decode(Page.self, from: response.data!)
                    handler(data)
                } catch {
                   
                }
            }
    }
}
