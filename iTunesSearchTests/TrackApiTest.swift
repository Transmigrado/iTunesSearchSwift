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
    
    
     override func spec() {
        
        var container: Container!
        beforeEach {
            container = Container()
            container.register(Api.self) { _ in TrackApi() }
        }
        
        it("fetch correctly data"){
            let fetcher = container.resolve(Api.self)!
            fetcher.retrieve(urlString: "http://www.google.com") { response in
                expect(response).to(contain("hello world"))
            }
        }
    }
}
