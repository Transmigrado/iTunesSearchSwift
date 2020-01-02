//
//  Api.swift
//  iTunesSearch
//
//  Created by Jorge Acosta on 02-01-20.
//  Copyright © 2020 Jorge Acosta. All rights reserved.
//

import Foundation

protocol Api {
    func retrieve(urlString: String, handler: @escaping  ((Any)->Void)) 
}
