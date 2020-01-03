//
//  TrackApiTest.swift
//  iTunesSearchTests
//
//  Created by Jorge Acosta on 02-01-20.
//  Copyright © 2020 Jorge Acosta. All rights reserved.
//

import Quick
import Nimble
import Swinject
@testable import iTunesSearch

class TrackApiTest: QuickSpec {
    
    struct MockTrackAPi: Api {
              
       func retrieve(urlString: String, handler: @escaping ((Any) -> Void)) {
           handler(["Hola"])
       }
    }
    
     override func spec() {
        
        var container: Container!
        beforeEach {
            container = Container()
            container.register(from:.trackModel, value: TrackModel(api: MockTrackAPi()))
            container.register(from: .root, value: ContentView(model: container.resolve(from: .trackModel)))
        }
        
        it("fetch correctly data"){
          
            let model : TrackModel = container.resolve(from: .trackModel)
            debugPrint(model.tracks)
        }
    }
}
