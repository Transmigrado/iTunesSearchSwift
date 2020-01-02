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
    
    struct mockTrackAPi: Api {
              
       func retrieve(urlString: String, handler: @escaping ((Any) -> Void)) {
           handler("hello world")
       }
    }
    
     override func spec() {
        
        var container: Container!
        beforeEach {
            container = Container()
            container.register(Api.self) { _ in mockTrackAPi() }
        }
        
        it("fetch correctly data"){
            let track = TrackModel()
            expect(track.tracks.count).to(equal(20))
        }
    }
}
