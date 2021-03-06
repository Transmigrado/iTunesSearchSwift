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
    func retrieve(urlString: String, handler: @escaping  ((Page)->Void))
}

class TrackApi : Api {
    
    var request : DataRequest?
    
    func retrieve(urlString: String, handler: @escaping ((Page)->Void))  {
        
        if request != nil {
            request?.cancel()
        }
      
        request = AF.request(URL(string: urlString.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)!)!)
            .responseJSON { response in
                
                switch response.result {
                    case .success(_):
                      do {
                        let data = try JSONDecoder().decode(Page.self, from: response.data!)
                        handler(data)
                      } catch let error {
                         debugPrint(error)
                      }
                    case .failure(_): break
                    
                }
                
            }
               
                
    }
}
