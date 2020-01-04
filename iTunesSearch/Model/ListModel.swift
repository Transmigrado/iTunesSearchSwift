//
//  ListModel.swift
//  iTunesSearch
//
//  Created by Jorge Acosta on 04-01-20.
//  Copyright © 2020 Jorge Acosta. All rights reserved.
//

import Foundation

protocol ListModel {
    func getTracks()->[Track]
    var page : Int {get set}
}
