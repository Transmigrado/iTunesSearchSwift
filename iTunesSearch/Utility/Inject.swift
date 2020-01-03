//
//  Inject.swift
//  iTunesSearch
//
//  Created by Jorge Acosta on 03-01-20.
//  Copyright © 2020 Jorge Acosta. All rights reserved.
//

import Foundation


import Swinject

enum InjectName:String {
    case root
    case trackModel
}

extension Container {
    func resolve<R>(from: InjectName) -> R {
        let r:Inject<R> = resolve(InjectContainer.self, name: from.rawValue) as! Inject<R>
        return r.value
    }

    func register<T>(from: InjectName, value:T){
        register(InjectContainer.self, name: from.rawValue) {_ in Inject<T>(value: value)}
    }
}

protocol InjectContainer {
}

struct Inject<T>:InjectContainer{
    var value: T
    init(value:T) {
        self.value = value
    }
}